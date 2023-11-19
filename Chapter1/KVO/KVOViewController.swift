//
//  KVOViewController.swift
//
//  Created by satoutakeshi on 2023/10/23.
//

import UIKit
import SwiftUI

struct KVOView: UIViewControllerRepresentable {
    typealias UIViewControllerType = KVOViewController

    func makeUIViewController(context: Context) -> KVOViewController {
        KVOViewController()
    }

    func updateUIViewController(_ uiViewController: KVOViewController, context: Context) {}
}

final class KVOViewController: UIViewController {
    @objc let bookModel = BookObjectObserve(isBorrowed: false)
    var observation: NSKeyValueObservation?
    private let label: UILabel = .init()
    private let button: UIButton = .init()
    private let imageView = UIImageView(image: UIImage(systemName: "book"))

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        label.text = "貸出可能"
        button.setTitle("この本を借りる", for: .normal)
        observation = observe(\.bookModel.isBorrowed, options: [.old, .new]) { object, change in
            Task { @MainActor in
                if change.newValue == true {
                    object.label.text = "貸出中"
                    object.button.setTitle("この本を返す", for: .normal)
                } else {
                    object.label.text = "貸出可能"
                    object.button.setTitle("この本を借りる", for: .normal)
                }
            }
        }
        button.addTarget(self, action: #selector(changeBorrowed), for: .touchUpInside)
    }

    @objc func changeBorrowed() {
        bookModel.switchBorrow()
    }

    func setupUI() {
        view.addSubview(imageView)
        view.addSubview(label)
        view.addSubview(button)

        imageView.contentMode = .scaleAspectFill

        imageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            imageView.heightAnchor.constraint(equalToConstant: 88),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 24),
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
}
