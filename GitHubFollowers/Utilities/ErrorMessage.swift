//
//  ErrorMessage.swift
//  GitHubFollowers
//
//  Created by Fred Lefevre on 2020-02-10.
//  Copyright © 2020 Fred Lefevre. All rights reserved.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername = "This username generated an invalid request. Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
}
