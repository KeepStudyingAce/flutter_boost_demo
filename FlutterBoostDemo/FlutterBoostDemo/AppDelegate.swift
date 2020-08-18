//
//  AppDelegate.swift
//  FlutterBoostDemo
//
//  Created by 金蚁-iOS on 2020/8/18.
//  Copyright © 2020 金蚁-iOS. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: FlutterAppDelegate {

    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GeneratedPluginRegistrant.register(with: self);
        return true
    }


    override func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

