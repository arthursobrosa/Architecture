//
//  ViewController.swift
//  ExampleProject
//
//  Created by Arthur Sobrosa on 10/07/24.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - ViewModel
    let viewModel: ViewModel
    
    // MARK: - Properties
    private lazy var myView: View = {
        let myView = View()
        
        // Connection between View and ViewController
        myView.delegate = self
        
        return myView
    }()
    
    // MARK: - Initializer
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        
        // View will ocuppy all ViewController's view space
        self.view = self.myView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Binding between ViewModel and ViewController
        self.viewModel.text.bind { [weak self] text in
            guard let self = self else { return }
            
            self.myView.myLabel.text = text
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.myView.myLabel.text = "Initial text"
    }
}

