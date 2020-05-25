//
//  FeedController.swift
//  Twiple
//
//  Created by Antonio Silva on 07/05/20.
//  Copyright © 2020 Antonio Silva. All rights reserved.
//

import UIKit
import SDWebImage

class FeedController: UIViewController {
    
    // MARK: - Properties
    var user: User? {
        didSet {
            configureLeftbarButton()
            print("DEBUG: Did set user in feed ctrll.")
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        let imageView = UIImageView(image: UIImage(named: "twitterlogopurpleish"))
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
        
        //show small image on topLeft from nav
        
    }
    
    func configureLeftbarButton() {
        guard let user = user else {
            print("DEBUG: User doesn't not exist")
            return
        }
        
        
        print("DEBUG: configure let bar button")
        let profileImageView = UIImageView()
        profileImageView.backgroundColor = .indigo
        profileImageView.setDimensions(width: 32, height: 32)
        profileImageView.layer.cornerRadius = 32 / 2
        profileImageView.layer.masksToBounds = true
        profileImageView.sd_setImage(with: user.profileImageUrl, completed: nil)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileImageView)
    }
}
