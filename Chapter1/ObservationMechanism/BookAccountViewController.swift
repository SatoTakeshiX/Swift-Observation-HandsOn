//
//  TutorialViewController.swift
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
    private var borrowedStatelabel: UILabel = .init()
    private var borrowedCountlabel: UILabel = .init()
    private var button: UIButton = .init()
    private let imageView = UIImageView(image: UIImage(systemName: "book"))

    override func viewDidLoad() {
        super.viewDidLoad()
        borrowedStatelabel.text = "貸出可能"
        button.setTitle("この本を借りる", for: .normal)
        button.addTarget(self, action: #selector(changeBorrowed), for: .touchUpInside)

        tracking()
        setupUI()
    }

    private func tracking() {
        withObservationTracking { [weak self] in
            guard let self else { return }
            if self.bookAccount.isBorrowed {
                self.borrowedStatelabel.text = "貸出中"
                self.button.setTitle("この本を返す", for: .normal)
            } else {
                self.borrowedStatelabel.text = "貸出可能"
                self.button.setTitle("この本を借りる", for: .normal)
            }

            self.borrowedCountlabel.text = "貸出回数: \(self.bookAccount.borrowedCount)"
        } onChange: { [weak self] in
            guard let self else { return }
            Task { @MainActor in
                self.tracking()
            }
        }
    }

    func setupUI() {
        view.addSubview(imageView)
        view.addSubview(borrowedStatelabel)
        view.addSubview(borrowedCountlabel)
        view.addSubview(button)

        imageView.contentMode = .scaleAspectFill

        imageView.translatesAutoresizingMaskIntoConstraints = false
        borrowedStatelabel.translatesAutoresizingMaskIntoConstraints = false
        borrowedCountlabel.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            imageView.heightAnchor.constraint(equalToConstant: 88),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            borrowedStatelabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            borrowedStatelabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            borrowedCountlabel.topAnchor.constraint(equalTo: borrowedStatelabel.bottomAnchor, constant: 8),
            borrowedCountlabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: borrowedCountlabel.bottomAnchor, constant: 24),
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
