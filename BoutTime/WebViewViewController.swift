//
//  WebViewViewController.swift
//  BoutTime
//
//  Created by Joe Sherratt on 24/06/2016.
//  Copyright © 2016 BlueFlameApps. All rights reserved.
//

import UIKit

class WebViewViewController: UIViewController {
    
    //-----------------------
    //MARK: Variables
    //-----------------------
    var url = ""
    
    //-----------------------
    //MARK: Outlets
    //-----------------------
    @IBOutlet weak var webView: UIWebView!
    
    //-----------------------
    //MARK: View
    //-----------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let requestURL = NSURL(string: url)
        let request = NSURLRequest(URL: requestURL!)
        webView.loadRequest(request)
    }
    
    //-----------------------
    //MARK: Button Actions
    //-----------------------
    @IBAction func closeWebView() {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //-----------------------
    //MARK: Extra
    //-----------------------
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
