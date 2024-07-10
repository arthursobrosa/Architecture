//
//  View.swift
//  ExampleProject
//
//  Created by Arthur Sobrosa on 10/07/24.
//

import UIKit

class View: UIView {
    weak var delegate: ViewControllerDelegate?
    
    // MARK: - Properties
    let myLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 50)
        lbl.textColor = .label
        lbl.textAlignment = .center
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        return lbl
    }()
    
    private lazy var myButton: UIButton = {
        let bttn = UIButton(configuration: .plain())
        bttn.setTitle("Change label text", for: .normal)
        bttn.addTarget(self, action: #selector(onTapMyButton), for: .touchUpInside)
        
        bttn.translatesAutoresizingMaskIntoConstraints = false
        
        return bttn
    }()
    
    // MARK: - Initializer
    init() {
        super.init(frame: .zero)
        
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Methods
    @objc private func onTapMyButton() {
        self.delegate?.onTapMyButton()
    }
}

// MARK: - UI Setup
extension View: ViewCodeProtocol {
    func setupUI() {
        self.addSubview(myLabel)
        self.addSubview(myButton)
        
        let padding = 20.0
        
        NSLayoutConstraint.activate([
            myLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            myLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            myLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            myLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            
            myButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -padding),
            myButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3),
            myButton.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -(padding * 2)),
            myButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}
