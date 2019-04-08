//
//  ViewController.swift
//  Poc
//
//  Created by Anand Pandey on 02/04/19.
//  Copyright © 2019 Anand Pandey. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {

    private let textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "My Label"
        
        return label
    }()
    
    private lazy var showVCButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8.0
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(showViewController(sender:)), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textLabel)
        view.addSubview(showVCButton)
        
        addConstraints()
    }
    
    private func addConstraints() {
        // label constraints
        textLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        textLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        // button contraints
        showVCButton.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 16).isActive = true
        showVCButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        showVCButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        showVCButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.setNeedsLayout()
    }
    
    
    
    @objc private func showViewController(sender: UIButton) {
        
        
        if let secondViewController = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC {
            secondViewController.buttonAction = {[weak self](text) -> () in
                self?.textLabel.text = text.text
                return secondViewController.dismiss(animated: true, completion: nil)
            }
            present(secondViewController, animated: true, completion: nil)
        }
    }

}

