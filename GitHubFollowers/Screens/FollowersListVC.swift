//
//  FollowersListVC.swift
//  GitHubFollowers
//
//  Created by Fred Lefevre on 2020-02-09.
//  Copyright © 2020 Fred Lefevre. All rights reserved.
//

import UIKit

class FollowersListVC: UIViewController {
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        NetworkManager.shared.getFollowers(for: username, page: 1) { (followers, errorMessage) in
            guard let followers = followers else {
                self.presentGFAlertOnMainThread(title: "Oh no...", message: errorMessage!.rawValue, buttonTitle: "Ok")
                return
            }
            
            print("Followers count: \(followers.count)")
            print(followers)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
