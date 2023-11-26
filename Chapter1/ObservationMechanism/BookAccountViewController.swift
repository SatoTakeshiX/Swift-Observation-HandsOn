//
//  BookAccountViewController.swift
//  Chapter1
//
//  Created by satoutakeshi on 2023/10/26.
//

import UIKit
import SwiftUI

struct BookAccountView: UIViewControllerRepresentable {
    typealias UIViewControllerType = BookAccountViewController

    func makeUIViewController(context: Context) -> BookAccountViewController {
        BookAccountViewController()
    }

    func updateUIViewController(_ uiViewController: BookAccountViewController, context: Context) {}
}

final class BookAccountViewController: UIViewController {
    private let bookAccount = BookAccount()
    private var flg: Bool = false
    private var borrowedStateLabel: UILabel = .init()
    private var borrowedCountLabel: UILabel = .init()
    private var button: UIButton = .init()
    private let imageView = UIImageView(image: UIImage(systemName: "book"))

    override func viewDidLoad() {
        super.viewDidLoad()
        borrowedStateLabel.text = "貸出可能"
        button.setTitle("この本を借りる", for: .normal)
        button.addTarget(self, action: #selector(changeBorrowed), for: .touchUpInside)

        tracking()
        setupUI()
    }

    private func tracking() {
        withObservationTracking { [weak self] in
            guard let self else { return }
            if self.bookAccount.isBorrowed {
                self.borrowedStateLabel.text = "貸出中"
                self.button.setTitle("この本を返す", for: .normal)
            } else {
                self.borrowedStateLabel.text = "貸出可能"
                self.button.setTitle("この本を借りる", for: .normal)
            }

            self.borrowedCountLabel.text = "貸出回数: \(self.bookAccount.borrowedCount)"
        } onChange: { [weak self] in
            guard let self else { return }
            Task { @MainActor in
                self.tracking()
            }
        }
    }

    // withObservationTrackingのキャンセルの説明用に実装しています
    // このViewControllerからはどこからも呼んでいません
    func render() {
        withObservationTracking { [weak self] in
            guard let self else { return }
            // 監視したプロパティにアクセス
            print(self.bookAccount.isBorrowed)
        } onChange: { [weak self] in
            guard let self else { return }
            Task { @MainActor in
                // キャンセルはフラグで制御
                // if self.flg {
                self.render()
                // }
            }
        }
    }

    func setupUI() {
        view.addSubview(imageView)
        view.addSubview(borrowedStateLabel)
        view.addSubview(borrowedCountLabel)
        view.addSubview(button)

        imageView.contentMode = .scaleAspectFill

        imageView.translatesAutoresizingMaskIntoConstraints = false
        borrowedStateLabel.translatesAutoresizingMaskIntoConstraints = false
        borrowedCountLabel.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            imageView.heightAnchor.constraint(equalToConstant: 88),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            borrowedStateLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            borrowedStateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            borrowedCountLabel.topAnchor.constraint(equalTo: borrowedStateLabel.bottomAnchor, constant: 8),
            borrowedCountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: borrowedCountLabel.bottomAnchor, constant: 24),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        var configuration = UIButton.Configuration.filled()
        configuration.baseForegroundColor = .black
        configuration.baseBackgroundColor = .white
        configuration.cornerStyle = .capsule
        configuration.buttonSize = .large
        var backgroundConfig = UIBackgroundConfiguration.clear()
        backgroundConfig.strokeColor = .black
        backgroundConfig.strokeWidth = 2
        configuration.background = backgroundConfig
        button.configuration = configuration
    }

    @objc func changeBorrowed() {
        bookAccount.switchBorrow()
    }
}
