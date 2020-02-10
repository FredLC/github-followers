//
//  User.swift
//  GitHubFollowers
//
//  Created by Fred Lefevre on 2020-02-10.
//  Copyright © 2020 Fred Lefevre. All rights reserved.
//

import Foundation

struct User: Codable {
    var login: String
    var avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    var htmlUrl: String
    var publicRepos: Int
    var publicGists: Int
    var followers: Int
    var following: Int
    var createdAt: String
}
