//
//  UserInfoVC.swift
//  GitHubFollowers
//
//  Created by Fred Lefevre on 2020-02-12.
//  Copyright © 2020 Fred Lefevre. All rights reserved.
//

import UIKit

protocol UserInfoVCDelegate: class {
    func didTapGithubProfile(forUser user: User)
    func didTapGetFollowers(forUser user: User)
}

class UserInfoVC: UIViewController {
    
    let headerView = UIView()
    let itemViewOne = UIView()
    let itemViewTwo = UIView()
    let dateLabel = GFBodyLabel(textAlignment: .center)
    var itemsViews: [UIView] = []
    
    var username: String!
    weak var delegate: FollowersListVCDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        layoutUI()
        getUserInfo()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    func getUserInfo() {
        NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    self.configureUIElements(withUser: user)
                }
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
    
    func configureUIElements(withUser user: User) {
        let repoItemVC = GFRepoItemVC(user: user)
        repoItemVC.delegate = self
        
        let followerItemVC = GFFollowerItemVC(user: user)
        followerItemVC.delegate = self
        
        self.add(childVC: repoItemVC, to: self.itemViewOne)
        self.add(childVC: followerItemVC, to: self.itemViewTwo)
        self.add(childVC: GFUserInfoHeaderVC(user: user), to: self.headerView)
        self.dateLabel.text = "Github member since \(user.createdAt.convertToDisplayFormat())"
    }
    
    func layoutUI() {
        let padding: CGFloat = 20
        let itemHeight: CGFloat = 140
        
        itemsViews = [headerView, itemViewOne, itemViewTwo, dateLabel]
        
        for itemView in itemsViews {
            view.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                itemView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
                itemView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
            ])
        }
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 180),
            
            itemViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            itemViewOne.heightAnchor.constraint(equalToConstant: itemHeight),
            
            itemViewTwo.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor, constant: padding),
            itemViewTwo.heightAnchor.constraint(equalToConstant: itemHeight),
            
            dateLabel.topAnchor.constraint(equalTo: itemViewTwo.bottomAnchor, constant: padding),
            dateLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
}

extension UserInfoVC: UserInfoVCDelegate {
    func didTapGetFollowers(forUser user: User) {
        guard user.followers != 0 else {
            presentGFAlertOnMainThread(title: "No followers", message: "This user doesn't have any followers, what a shame 😞.", buttonTitle: "So sad")
            return
        }
        delegate.didRequestFollowersList(forUsername: user.login)
        dismissVC()
    }
    
    func didTapGithubProfile(forUser user: User) {
        guard let url = URL(string: user.htmlUrl) else {
            presentGFAlertOnMainThread(title: "Invalid URL", message: "The url attached to this user profile is invalid.", buttonTitle: "Ok")
            return
        }
        presentSafariVC(forUrl: url)
    }
}
