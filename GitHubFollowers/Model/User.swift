//
//  User.swift
//  GitHubFollowers
//
//  Created by Fred Lefevre on 2020-02-10.
//  Copyright © 2020 Fred Lefevre. All rights reserved.
//

import Foundation

struct User: Codable {
    let login: String
    let avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    let htmlUrl: String
    let publicRepos: Int
    let publicGists: Int
    let followers: Int
    let following: Int
    let createdAt: String
}
