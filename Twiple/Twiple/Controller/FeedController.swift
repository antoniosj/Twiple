//
//  FeedController.swift
//  Twiple
//
//  Created by Antonio Silva on 07/05/20.
//  Copyright © 2020 Antonio Silva. All rights reserved.
//

import UIKit

class FeedController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .systemPurple
        let imageView = UIImageView(image: UIImage(named: "twitterlogopurple"))
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }
}
