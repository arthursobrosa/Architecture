//
//  ViewControllerDelegate.swift
//  ExampleProject
//
//  Created by Arthur Sobrosa on 10/07/24.
//

import UIKit

protocol ViewControllerDelegate: AnyObject {
    func onTapMyButton()
}

extension ViewController: ViewControllerDelegate {
    func onTapMyButton() {
        self.viewModel.changeText()
    }
}
