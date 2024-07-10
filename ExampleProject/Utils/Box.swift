//
//  Box.swift
//  ExampleProject
//
//  Created by Arthur Sobrosa on 10/07/24.
//

import Foundation

final class Box<T> {
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    var value: T {
        didSet {
            self.listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
