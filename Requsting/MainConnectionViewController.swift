//
//  MainConnectionViewController.swift
//  Requsting
//
//  Created by vichhai on 7/20/15.
//  Copyright (c) 2015 kan vichhai. All rights reserved.
//

public let stringURl : String = "http://icodingkh.com/server/server.php?SubID=1&Start=0&NumRec=9"

import UIKit

protocol MainConnectionDelegate {
    func returnResult(arrayResult : AnyObject)
    func returnWithError(error : NSError)
}

class MainConnectionViewController: UIViewController {

    var delegate : MainConnectionDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sendTranData(apiKey : String , withParamether : NSDictionary?) {
        
//        let manager = AFHTTPRequestOperationManager()
//        manager.POST(apiKey, parameters: withParamether, constructingBodyWithBlock: { (data :AFMultipartFormData) -> Void in
//            
//            }, success: { (operation : AFHTTPRequestOperation,response: AnyObject) -> Void in
//                self.delegate.returnResult(response)
//            }) { (operation:AFHTTPRequestOperation, error : NSError) -> Void in
//                self.delegate.returnWithError(error)
//        }
        
    }

}
