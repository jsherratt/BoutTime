//
//  ViewController.swift
//  BoutTime
//
//  Created by Joe Sherratt on 19/06/2016.
//  Copyright © 2016 BlueFlameApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //-----------------------
    //MARK: Variables
    //-----------------------
    let nextRoundFailImg = UIImage(named: "next_round_fail")
    let nextRoundSuccessImg = UIImage(named: "next_round_success")
    
    //Timer
    var timer = NSTimer()
    var seconds = 10
    var timerIsRunning = false
    
    //-----------------------
    //MARK: Outlets
    //-----------------------
    
    //Views
    @IBOutlet var arrayOfViews: [UIView]!
    
    //Labels
    @IBOutlet weak var text1Label: UILabel!
    @IBOutlet weak var text2Label: UILabel!
    @IBOutlet weak var text3Label: UILabel!
    @IBOutlet weak var text4Label: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    //Buttons
    @IBOutlet weak var fullDownBtn: UIButton!
    @IBOutlet weak var halfUpBtn1: UIButton!
    @IBOutlet weak var halfDownBtn1: UIButton!
    @IBOutlet weak var halfUpBtn2: UIButton!
    @IBOutlet weak var halfDownBtn2: UIButton!
    @IBOutlet weak var fullUpBtn: UIButton!
    @IBOutlet weak var nextRoundBtn: UIButton!
    
    //-----------------------
    //MARK: View
    //-----------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Round corners of white views
        roundCorners()
        
        
    }
    
    //-----------------------
    //MARK: Button Actions
    //-----------------------
    @IBAction func nextRound() {
        
        nextRoundBtn.hidden = true
        
        //TODO: add code to move to the next round
    }
    
    //-----------------------
    //MARK: Functions
    //-----------------------
    func roundCorners () {
        
        for view in arrayOfViews {
            
            //For each view in the array of view round the corner with a radius of 5
            view.layer.cornerRadius = 5
            view.clipsToBounds = true
        }
        
    }
    
    //-----------------------
    //MARK: Timer
    //-----------------------
    func startTimer() {
        
        if timerIsRunning == false {
            
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.countdown), userInfo: nil, repeats: true)
            timerIsRunning = true
        }
    }
    
    func countdown() {
        
        seconds -= 1
        
        if seconds == 0 {
            
            timer.invalidate()
            seconds = 60
            timerIsRunning = false
            
            nextRoundBtn.hidden = false
            
            //TODO: add function call to check the order of events
        }
        
        timerLabel.text = "0:\(seconds)"
    }
    
    //-----------------------
    //MARK: Device motion
    //-----------------------
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        
        //Detect shake motion
        if motion == .MotionShake {
            
            //TODO: add function call to check the order of events
        }
    }
    
    //-----------------------
    //MARK: Extra
    //-----------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

