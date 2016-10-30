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
        
        let requestURL = URL(string: url)!
        let request = URLRequest(url: requestURL)
        webView.loadRequest(request)
    }
    
    //-----------------------
    //MARK: Button Actions
    //-----------------------
    @IBAction func closeWebView() {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    //-----------------------
    //MARK: Extra
    //-----------------------
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
