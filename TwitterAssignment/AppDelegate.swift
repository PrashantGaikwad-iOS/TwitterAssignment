//
//  AppDelegate.swift
//  TwitterAssignment
//
//  Created by Prashant G on 12/10/18.
//  Copyright © 2018 Prashant G. All rights reserved.
//

import UIKit
import TwitterKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    private func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return TWTRTwitter.sharedInstance().application(app, open: url, options: options)
    }

}



//        Access token & access token secret
//        1025276369780068352-Ezg5OyvmbQD2OQlWzoDnpt17xEHS1X (Access token)
//        5cnXRMNmEe4SFZmzcM1TjPDqvPQZYLSnTYTJ4mDTpZb3I (Access token secret)

//        Consumer API keys
//        rLRYJTvwVzeQlHY9TV1QusdKl (API key)
//        cm70olAkbugHWjl7tSRCEsKhxfbtdnX9KnTJCk919aTKCMSo06 (API secret key)

//TWTRTwitter.sharedInstance().start(withConsumerKey: "rLRYJTvwVzeQlHY9TV1QusdKl", consumerSecret: "cm70olAkbugHWjl7tSRCEsKhxfbtdnX9KnTJCk919aTKCMSo06")

// using TwitterKit
//        TWTRTwitter.sharedInstance().logIn {
//            (session, error) -> Void in
//            if (session != nil) {
//
//                print(session?.userName)
//                print(session?.userID)
//            } else {
//                print("error")
//
//            }
//        }
