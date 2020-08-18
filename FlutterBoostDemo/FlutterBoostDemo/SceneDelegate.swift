//
//  SceneDelegate.swift
//  FlutterBoostDemo
//
//  Created by 金蚁-iOS on 2020/8/18.
//  Copyright © 2020 金蚁-iOS. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    var event: FLBVoidCallback?;


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
         
            if let windoeScene = (scene as? UIWindowScene) {
                /// FlutterBoostPlugin开启
                let router = PlatformRouterImp.init();
                FlutterBoostPlugin.sharedInstance().startFlutter(with: router, onStart: { (engine) in

                });
                    
// MARK: - 第一个页面是原生页面:ViewController
                    

//                let nav = self.window?.rootViewController as! UINavigationController
//                nav.navigationBar.isHidden = true
//                let main = UIStoryboard.init(name: "Main", bundle: nil)
//                self.event = FlutterBoostPlugin.sharedInstance().addEventListener({ (name, arguments) in
//                /// Flutter页面跳转原生页面
//                    let secondVC = main.instantiateViewController(withIdentifier: "SecondViewController")
//                    nav.pushViewController(secondVC, animated: true)
//                }, forName: "presentNative")
                    
                    
                   
// MARK: - 第一个页面是FlutterViewController 默认在Main函数里的MyApp()

                let windowTemp = UIWindow.init(windowScene: windoeScene)
                    let appDelegate = UIApplication.shared.delegate as? AppDelegate
#warning("使用engine初始化FlutterViewController 解决flutter_boost一开始进入Flutter后跳转native页面失败的问题")

                let flVC = FlutterViewController.init(engine: (appDelegate?.flutterEngine)!, nibName: nil, bundle: nil);
//                     设置为具体某一个Flutter页面
//                   let vc = FLBFlutterViewContainer.init();
//                   vc.setName("flutterPage", params: [:]);
                windowTemp.rootViewController = flVC
               let main = UIStoryboard.init(name: "Main", bundle: nil)
               self.event = FlutterBoostPlugin.sharedInstance().addEventListener({ (name, arguments) in
               /// Flutter页面跳转原生页面
                   let secondVC = main.instantiateViewController(withIdentifier: "SecondViewController")
#warning("present跳转原生页面后再push的时候会崩，所以present应该是修改push的专场动画并将系统导航栏隐藏的封装")
                    flVC.present(secondVC, animated: true) {
                }
               }, forName: "presentNative")

                self.window = windowTemp;
            }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
        self.event = nil
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

