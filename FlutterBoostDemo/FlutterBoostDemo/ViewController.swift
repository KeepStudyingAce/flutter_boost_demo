//
//  ViewController.swift
//  FlutterBoostDemo
//
//  Created by 金蚁-iOS on 2020/8/18.
//  Copyright © 2020 金蚁-iOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goFirstFlutter(_ sender: Any) {
        //跳转Flutter页面一
        FlutterBoostPlugin.open("first", urlParams:[kPageCallBackId:"MycallbackId#1"], exts: ["animated":true], onPageFinished: { (_ result:Any?) in
            print(String(format:"call me when page finished, and your result is:%@", result as! CVarArg));
        }) { (f:Bool) in
            print(String(format:"page is opened\(f)"));
        }
    }
    

}

