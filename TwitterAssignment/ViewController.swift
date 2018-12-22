//
//  ViewController.swift
//  TwitterAssignment
//
//  Created by Prashant G on 12/10/18.
//  Copyright © 2018 Prashant G. All rights reserved.
//

import UIKit
import TwitterKit

class ViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var idLabel: UILabel!
    @IBOutlet var friendsTableView: UITableView!
    
    // MARK: - Data
    @IBOutlet var btnlogout: UIButton!
    @IBOutlet var btnlogin: UIButton!
    let cellIdentifier = "FriendCell"
    var friendsResult: [String:Any] = [:]
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Hide the logout button on start
        self.btnlogout.isHidden = true
        
        //Set the keys
        FHSTwitterEngine.shared().permanentlySetConsumerKey("rLRYJTvwVzeQlHY9TV1QusdKl", andSecret: "cm70olAkbugHWjl7tSRCEsKhxfbtdnX9KnTJCk919aTKCMSo06")
        
    }
    
    // MARK: - Custom Actions
    @IBAction func logout(_ sender: Any) {
        FHSTwitterEngine.shared().clearAccessToken()
        self.btnlogin.isHidden = false
        self.btnlogout.isHidden = true
    }
    
    @IBAction func login(_ sender: Any) {
        // Twitter Login Call
        let login =  FHSTwitterEngine.shared().loginController { (success) in
            
            // update the UI button
            self.btnlogin.isHidden = true
            self.btnlogout.isHidden = false
            
            // Set Id and Name
            self.idLabel.text = FHSTwitterEngine.shared()?.authenticatedID
            self.usernameLabel.text = FHSTwitterEngine.shared().authenticatedUsername
            
            // Fetch List of freinds
            self.friendsResult = FHSTwitterEngine.shared()?.listFriends(forUser: FHSTwitterEngine.shared()?.authenticatedUsername, isID: true, withCursor: "-1") as! [String:Any]
            print(self.friendsResult)
            
            // Reload friendsTableView
            self.friendsTableView.reloadData()
            
            /*
             Other functions -
             // Fetch Home Feed tweets
             let resultHomeFeed = FHSTwitterEngine.shared().getHomeTimeline(sinceID: FHSTwitterEngine.shared().authenticatedID, count: 10)
             print(resultHomeFeed)
             
             // Post Tweet
             let resultTweetStatus = FHSTwitterEngine.shared().postTweet("My tweet")
             print(resultTweetStatus)
             
             // To clear consumer key
             FHSTwitterEngine.shared().clearConsumer()
             
             // To load access token
             FHSTwitterEngine.shared().loadAccessToken()
             
             // To clear access token
             FHSTwitterEngine.shared().clearAccessToken()
             
             // Check if session is valid or not
             FHSTwitterEngine.shared().isAuthorized()
             */
            
            } as UIViewController
        self.present(login, animated: true, completion: nil)
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        _ = friendsResult["users"] as! [Any]
        return cell
    }
}
