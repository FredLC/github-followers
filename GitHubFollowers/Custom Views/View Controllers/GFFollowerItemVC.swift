//
//  GFFollowerItemVC.swift
//  GitHubFollowers
//
//  Created by Fred Lefevre on 2020-02-13.
//  Copyright © 2020 Fred Lefevre. All rights reserved.
//

import UIKit

class GFFollowerItemVC: GFItemInfoVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.setBackground(backgroundColor: .systemGreen, title: "Get Followers")
    }
    

}
