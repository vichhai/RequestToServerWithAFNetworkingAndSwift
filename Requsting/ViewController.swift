//
//  ViewController.swift
//  Requsting
//
//  Created by vichhai on 6/27/15.
//  Copyright (c) 2015 kan vichhai. All rights reserved.
//

import UIKit

class ViewController: MainConnectionViewController,UITableViewDataSource,UITableViewDelegate,MainConnectionDelegate {

    @IBOutlet weak var tv_response: UITextView!
    @IBOutlet weak var myTableView: UITableView!
    var jdict = NSDictionary()
    var responseArray : NSMutableArray = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let manager = AFHTTPRequestOperationManager()
        var requestDic = Dictionary<String,String>()
        requestDic["SubID"] = "1"
        requestDic["Start"] = "0"
        requestDic["NumRec"] = "9"
        
        manager.GET("http://icodingkh.com/server/server.php?", parameters: requestDic.description, success: { (operation :AFHTTPRequestOperation, response :AnyObject) -> Void in
            print(response.count)
            
            self.responseArray = NSMutableArray(array: response as! [AnyObject])
            
            self.myTableView.reloadData()
    
            }) { (operation : AFHTTPRequestOperation, error:NSError) -> Void in
            print("Error \(error.localizedDescription)")
        }
        super.sendTranData(stringURl, withParamether: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // =----> MainConnection delegate methods
    
    func returnWithError(error: NSError) {
        println(error)
    }
    
    func returnResult(arrayResult: AnyObject) {
        println(arrayResult)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cells", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = responseArray.objectAtIndex(indexPath.row).objectForKey("Article_title") as? String
//        print(responseArray.objectAtIndex(indexPath.row))
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return responseArray.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("detail", sender: responseArray.objectAtIndex(indexPath.row).objectForKey("Article_ID"))
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detail" {
            var view1 : DetailViewController = segue.destinationViewController as! DetailViewController
            view1.data = sender
        }
    }
    
}

