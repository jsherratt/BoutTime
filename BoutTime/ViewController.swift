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
    var textBtnsArray: [UIButton] = []
    
    //-----------------------
    //MARK: Outlets
    //-----------------------
    
    //Views
    @IBOutlet var arrayOfViews: [UIView]!
    
    //Labels
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    //Buttons
    
    //Btns to display event text
    @IBOutlet weak var text1Btn: UIButton!
    @IBOutlet weak var text2Btn: UIButton!
    @IBOutlet weak var text3Btn: UIButton!
    @IBOutlet weak var text4Btn: UIButton!
    
    //Control text postion btns and next round
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
        
        //Add text btns to array
        textBtnsArray.append(text1Btn)
        textBtnsArray.append(text2Btn)
        textBtnsArray.append(text3Btn)
        textBtnsArray.append(text4Btn)
        
        //Disable user interaction with btns so users cannot go to the webview during a round
        disableInteractionWithBtns(interactionDisabeld: true)
        
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
    
    @IBAction func moveOption(sender: UIButton) {
        
        
    }
    
    @IBAction func goToWebviewOfEvent(sender: UIButton) {
        
        //TODO: add code to go to webview with information about event tapped
        
        let tag = sender.tag
        
        switch tag {
            
        case 1:
            print("text btn 1")
            
        default:
            break
        }
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
    
    func disableInteractionWithBtns(interactionDisabeld bool: Bool) {
        
        for btn in textBtnsArray {
            
            if bool == true {
                
                btn.userInteractionEnabled = false
            }else {
                btn.userInteractionEnabled = true
            }
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

