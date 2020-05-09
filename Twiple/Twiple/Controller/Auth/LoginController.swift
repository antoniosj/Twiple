//
//  LoginController.swift
//  Twiple
//
//  Created by Antonio Silva on 09/05/20.
//  Copyright © 2020 Antonio Silva. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    // MARK: - Properties
    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = UIImage(named: "twitterlogopurpleish")
        return iv
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .customPurple
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        //img view centralizada no topo + meio
        view.addSubview(logoImageView)
        logoImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor, paddingTop: 0)
        logoImageView.setDimensions(width: 150, height: 150)
    }
}
