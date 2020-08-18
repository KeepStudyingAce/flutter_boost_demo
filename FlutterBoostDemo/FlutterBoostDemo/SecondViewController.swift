//
//  SecondViewController.swift
//  iOSFlutterFix
//
//  Created by 金蚁-iOS on 2020/8/13.
//  Copyright © 2020 金蚁-iOS. All rights reserved.
//

import UIKit

class SecondViewController: BaseNativeViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goNextFlutterView(_ sender: Any) {
        FlutterBoostPlugin.open("second", urlParams:[kPageCallBackId:"MycallbackId#2"], exts: ["animated":true], onPageFinished: { (_ result:Any?) in
            print(String(format:"call me when page finished, and your result is:%@", result as! CVarArg));
        }) { (f:Bool) in
            print(String(format:"page is opened"));
        }
    }
    

    @IBAction func backToLastScreen(_ sender: Any) {
//        FlutterBoostPlugin.close(<#T##uniqueId: String##String#>, result: <#T##[AnyHashable : Any]#>, exts: <#T##[AnyHashable : Any]#>, completion: <#T##(Bool) -> Void#>)
               self.navigationController?.popViewController(animated: true);
    }
    
    
}
