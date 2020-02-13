//
//  FavoritesListVC.swift
//  GitHubFollowers
//
//  Created by Fred Lefevre on 2020-02-09.
//  Copyright © 2020 Fred Lefevre. All rights reserved.
//

import UIKit

class FavoritesListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        PersistenceManager.retrieveFavorites { (result) in
            switch result {
            case .success(let favorites):
                print(favorites)
            case .failure(let error):
                break
            }
        }
    }

}
