//
//  ScoreViewController.swift
//  BoutTime
//
//  Created by Joe Sherratt on 24/06/2016.
//  Copyright © 2016 BlueFlameApps. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {
    
    //-----------------------
    //MARK: Variables
    //-----------------------
    var correctAnswers: Int = 0
    
    //-----------------------
    //MARK: Outlets
    //-----------------------
    @IBOutlet weak var scoreLabel: UILabel!
    
    //-----------------------
    //MARK: View
    //-----------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "You scored \(correctAnswers) out of 6"
    }
    
    //-----------------------
    //MARK: Button Actions
    //-----------------------
    @IBAction func playAgain() {
        
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
