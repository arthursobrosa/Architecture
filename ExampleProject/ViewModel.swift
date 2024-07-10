//
//  ViewModel.swift
//  ExampleProject
//
//  Created by Arthur Sobrosa on 10/07/24.
//

import Foundation

class ViewModel {
    var text = Box(String())
    
    func changeText() {
        self.text.value = "New text"
    }
}
