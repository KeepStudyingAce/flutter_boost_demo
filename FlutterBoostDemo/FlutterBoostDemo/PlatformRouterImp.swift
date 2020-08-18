//
//  PlatformRouterImp.swift
//  Runner
//
//  Created by yujie on 2019/9/18.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

import Foundation

//实现FLBPlatform协议方法，flutter项目和原生项目使用FlutterBoost进行的跳转都会通过该类进行处理
class PlatformRouterImp: NSObject, FLBPlatform {
    func openNative(_ url: String, urlParams: [AnyHashable : Any], exts: [AnyHashable : Any], completion: @escaping (Bool) -> Void) {
        var animated = false;
        if exts["animated"] != nil{
            animated = exts["animated"] as! Bool;
        }
        
        //与Flutter端约定跳转原生的URL为三段式结构native_method(push/present)_name(Controller name);
        let urlArr = url.components(separatedBy: "_")
        if urlArr.count == 3 {
            /// swift中的空间命名，与OC中不一样，Swift这样的做法可以有效避免类名一样的问题
            let cls: AnyClass? = NSClassFromString("iOSFlutterFix." + urlArr[2]);
            if let clsType = cls as? BaseNativeViewController.Type {
                let targetViewController = clsType.init();
                targetViewController.params = urlParams;
                let demo = UIViewController();
                if urlArr[1] == "push" {
                    self.navigationController().pushViewController(demo, animated: animated);
                    completion(true);
                } else if urlArr[1] == "present" {
                    //创建一个新的导航栏来present
                    let navVc = UINavigationController.init(rootViewController: targetViewController);
                    self.navigationController().viewControllers.last?.present(navVc, animated: animated, completion: nil);
                    completion(true);
                }
            }

        } else {
            completion(false);
        }
        
    }
    
    func open(_ url: String, urlParams: [AnyHashable : Any], exts: [AnyHashable : Any], completion: @escaping (Bool) -> Void) {
        if url.hasPrefix("native") {
            openNative(url, urlParams: urlParams, exts: exts, completion: completion);
        }
        var animated = false;
        if exts["animated"] != nil{
            animated = exts["animated"] as! Bool;
        }
        let vc = FLBFlutterViewContainer.init();
        vc.setName(url, params: urlParams);
        self.navigationController().pushViewController(vc, animated: animated);
        completion(true);
    }
    
    func present(_ url: String, urlParams: [AnyHashable : Any], exts: [AnyHashable : Any], completion: @escaping (Bool) -> Void) {
        var animated = false;
        if exts["animated"] != nil{
            animated = exts["animated"] as! Bool;
        }
        let vc = FLBFlutterViewContainer.init();
        vc.setName(url, params: urlParams);
        navigationController().present(vc, animated: animated) {
            completion(true);
        };
    }
    
    func close(_ uid: String, result: [AnyHashable : Any], exts: [AnyHashable : Any], completion: @escaping (Bool) -> Void) {
        var animated = false;
        if exts["animated"] != nil{
            animated = exts["animated"] as! Bool;
        }
        let presentedVC = self.navigationController().presentedViewController;
        let vc = presentedVC as? FLBFlutterViewContainer;
        if vc?.uniqueIDString() == uid {
            vc?.dismiss(animated: animated, completion: {
                completion(true);
            });
        }else{
            self.navigationController().popViewController(animated: animated);
        }
    }
    
    func navigationController() -> UINavigationController {
        
        let scenes = UIApplication.shared.connectedScenes.first! as! UIWindowScene;
        let delegate = scenes.delegate as! SceneDelegate
        let navigationController = delegate.window?.rootViewController as! UINavigationController

        return navigationController;
    }
}
