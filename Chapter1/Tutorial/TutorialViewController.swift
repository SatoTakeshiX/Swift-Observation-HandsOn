//
//  TutorialViewController.swift
//  Chapter1
//
//  Created by satoutakeshi on 2023/10/26.
//

import UIKit
import SwiftUI

struct TutorialView: UIViewControllerRepresentable {
    typealias UIViewControllerType = TutorialViewController

    func makeUIViewController(context: Context) -> TutorialViewController {
        TutorialViewController()
    }

    func updateUIViewController(_ uiViewController: TutorialViewController, context: Context) {}
}

final class TutorialViewController: UIViewController {
    let bookAccount = BookAccount()

    override func viewDidLoad() {
        super.viewDidLoad()
        tracking()
    }

    private func tracking() {
        withObservationTracking {
            print(bookAccount.isBorrowed)
            print(bookAccount.borrowedCount)
        } onChange: { [weak self] in
            guard let self else { return }
            Task { @MainActor in
                self.tracking()
            }
        }
    }

    private func setupUI() {
        
    }
}
