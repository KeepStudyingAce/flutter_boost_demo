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
    public var flutterEngine: FlutterEngine?

    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        /*
         通常建议为应用程序预先创建一个长生命周期的FlutterEngine，因为：
        显示FlutterViewController时，第一帧显示会更快。
        您的Flutter和Dart状态将超过一个FlutterViewController的生存时间。
        在显示UI之前，您的应用程序和插件可以与Flutter和Dart逻辑进行交互。
        */
// MARK: - 使用engine初始化FlutterViewController 解决flutter_boost一开始进入Flutter后跳转native页面失败的问题
        self.flutterEngine = FlutterEngine.init(name: "MyFlutterEngine")
        self.flutterEngine?.run()
        GeneratedPluginRegistrant.register(with: self.flutterEngine!)
        return true
    }


    override func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

