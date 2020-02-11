//
//  GFAvatarImageView.swift
//  GitHubFollowers
//
//  Created by Fred Lefevre on 2020-02-11.
//  Copyright © 2020 Fred Lefevre. All rights reserved.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    let placeholderImage = UIImage(named: "avatar-placeholder")!

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        image = placeholderImage
        clipsToBounds = true
        layer.cornerRadius = 10
    }
    
}
