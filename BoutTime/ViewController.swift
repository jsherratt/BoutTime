//
//  ViewController.swift
//  BoutTime
//
//  Created by Joe Sherratt on 19/06/2016.
//  Copyright © 2016 BlueFlameApps. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController {
    
    //-----------------------
    //MARK: Variables
    //-----------------------
    
    //Btn images
    let nextRoundFailImg = UIImage(named: "next_round_fail")
    let nextRoundSuccessImg = UIImage(named: "next_round_success")
    
    //Quiz
    var eventQuiz: EventsQuiz
    var shuffledQuiz = EventsQuiz(events: [])
    var roundQuiz = EventsQuiz(events: [])
    var correctAnswers = 0
    var roundsCompleted = 0
    let numberOfRounds = 2
    var index = 0
    var webUrl = ""
    
    //Timer
    var timer = NSTimer()
    var seconds = 120
    var timerIsRunning = false
    var eventBtnsArray: [UIButton] = []
    
    //-----------------------
    //MARK: Init
    //-----------------------
    required init?(coder aDecoder: NSCoder) {
        
        do {
            let array = try PlistConverter.arrayFromFile("EventList", ofType: "plist")
            self.eventQuiz = EventsQuiz(events: EventsUnarchiver.eventsFromArray(array))
            
        } catch let error {
            fatalError("\(error)")
        }
        super.init(coder: aDecoder)
    }
    
    //-----------------------
    //MARK: Outlets
    //-----------------------
    
    //Views
    @IBOutlet var arrayOfViews: [UIView]!
    
    //Labels
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
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
    @IBOutlet weak var showScoreBtn: UIButton!
    
    //-----------------------
    //MARK: View
    //-----------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Add text btns to array
        eventBtnsArray.append(text1Btn)
        eventBtnsArray.append(text2Btn)
        eventBtnsArray.append(text3Btn)
        eventBtnsArray.append(text4Btn)
        
        //Round corners of white views
        roundCorners()
        
        //Set up and start the game
        setUpGame()
    }
    
    //-----------------------
    //MARK: Button Actions
    //-----------------------
    @IBAction func nextRound() {
        
        //Disable btns, clear the round array, display new events and reset the timer
        disableInteractionWithBtns(interactionDisabeld: true)
        roundQuiz.events.removeAll()
        nextRoundBtn.hidden = true
        displayEvents()
        startTimer()
    }
    
    @IBAction func moveOption(sender: UIButton) {
        
        //swap btn titles
        let tag = sender.tag
        
        switch tag {
            
        case 1:
            
            swapBtnTitles(text1Btn, destinationPos: text2Btn)
            
        case 2:
            
            swapBtnTitles(text2Btn, destinationPos: text1Btn)
            
        case 3:
            
            swapBtnTitles(text2Btn, destinationPos: text3Btn)
            
        case 4:
            
            swapBtnTitles(text3Btn, destinationPos: text2Btn)
            
        case 5:
            
            swapBtnTitles(text3Btn, destinationPos: text4Btn)
            
        case 6:
            
            swapBtnTitles(text4Btn, destinationPos: text3Btn)
            
        default:
            break
        }
    }
    
    @IBAction func goToWebviewOfEvent(sender: UIButton) {
        
        //TODO: add code to go to webview with information about event tapped
        
        let tag = sender.tag
        
        switch tag {
            
        case 1:
            
            //Perform segue to webViewController
            webUrl = roundQuiz.events[0].url
            performSegueWithIdentifier("showWebView", sender: self)
            
        case 2:
            
            webUrl = roundQuiz.events[1].url
            performSegueWithIdentifier("showWebView", sender: self)
            
        case 3:
            
            webUrl = roundQuiz.events[2].url
            performSegueWithIdentifier("showWebView", sender: self)
            
        case 4:
            
            webUrl = roundQuiz.events[3].url
            performSegueWithIdentifier("showWebView", sender: self)
            
        default:
            break
        }
    }
    
    //-----------------------
    //MARK: Game Functions
    //-----------------------
    func displayEvents() {
        
        //Display events from the shuffled array and take events in groups of 4
        //i.e. the first 4 events for round 1, then the next 4 events for round 2 etc
        if index >= shuffledQuiz.events.count {
            
        }else {
            
            //Set text of btn titles
            text1Btn.setTitle(shuffledQuiz.events[index].name, forState: .Normal)
            text2Btn.setTitle(shuffledQuiz.events[index + 1].name, forState: .Normal)
            text3Btn.setTitle(shuffledQuiz.events[index + 2].name, forState: .Normal)
            text4Btn.setTitle(shuffledQuiz.events[index + 3].name, forState: .Normal)
            
            //Append events to round array
            roundQuiz.events.append(shuffledQuiz.events[index])
            roundQuiz.events.append(shuffledQuiz.events[index + 1])
            roundQuiz.events.append(shuffledQuiz.events[index + 2])
            roundQuiz.events.append(shuffledQuiz.events[index + 3])
  
            index += 4
        }
    }
    
    func checkAnswer() {
        
        //Increment round completed
        roundsCompleted += 1
        
        //Get answers of current round events
        let sortedEvents = sortEventsForRound(roundQuiz)
        
        let answer1 = text1Btn.titleLabel?.text
        let answer2 = text2Btn.titleLabel?.text
        let answer3 = text3Btn.titleLabel?.text
        let answer4 = text4Btn.titleLabel?.text
        
        //Compare the btn titles to the answers. If they all match up then the events are chronological order. Else the events are in the wrong order
        if answer1 == sortedEvents[0].name && answer2 == sortedEvents[1].name && answer3 == sortedEvents[2].name && answer4 == sortedEvents[3].name {
            
            correctAnswers += 1
            infoLabel.text = "Tap on a president for more info"
            nextRoundBtn.hidden = false
            nextRoundBtn.setImage(nextRoundSuccessImg, forState: .Normal)
            disableInteractionWithBtns(interactionDisabeld: false)
            
        }else {
            
            disableInteractionWithBtns(interactionDisabeld: false)
            infoLabel.text = "Tap on a president for more info"
            nextRoundBtn.hidden = false
            nextRoundBtn.setImage(nextRoundFailImg, forState: .Normal)
        }
        
        //Check if the number of rounds completed is equal to the number of rounds. If so then end the game and show score
        if roundsCompleted == numberOfRounds {
            
            infoLabel.text = "Game Over!"
            nextRoundBtn.userInteractionEnabled = false
            showScoreBtnWithDelay(seconds: 2)
            resetTimer()
            timerLabel.hidden = true
        }
    }
    
    func setUpGame() {
        
        //Set up the game
        disableInteractionWithBtns(interactionDisabeld: true)
        roundsCompleted = 0
        index = 0
        showScoreBtn.hidden = true
        nextRoundBtn.userInteractionEnabled = true
        shuffleEvents(eventQuiz)
        roundQuiz.events.removeAll()
        displayEvents()
        timerLabel.hidden = false
        startTimer()
    }
    
    
    //-----------------------
    //MARK: Helper Functions
    //-----------------------
    func roundCorners () {
        
        for view in arrayOfViews {
            
            //For each view in the array of view round the corner with a radius of 5
            view.layer.cornerRadius = 5
            view.clipsToBounds = true
        }
    }
    
    func disableInteractionWithBtns(interactionDisabeld bool: Bool) {
        
        //Disable the interaction of the event btns so that the user cannot tap a btn to get more info during the middle of a round
        for btn in eventBtnsArray {
            
            if bool == true {
                
                btn.userInteractionEnabled = false
            }else {
                btn.userInteractionEnabled = true
            }
        }
    }
    
    func shuffleEvents(quiz: EventsQuiz) {
        
        //Shuffle the events so that the same game is not repeated
        let shuffledEvents = EventsQuiz(events: GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(quiz.events) as! [Events])
        shuffledQuiz = shuffledEvents
    }
    
    func sortEventsForRound(events: EventsQuiz) -> [Events]{
        
        //Sort events date by descending order. Most recent date to least recent date
        return events.events.sort({$0.date > $1.date})
    }
    
    func swapBtnTitles(originalPos: UIButton, destinationPos: UIButton) {
        
        //Swap btn titles. Takes the first btn title and swaps it with the second btn title.
        let firstBtnTitle = originalPos.titleForState(.Normal)
        let secondBtnTitle = destinationPos.titleForState(.Normal)
        
        originalPos.setTitle(secondBtnTitle, forState: .Normal)
        destinationPos.setTitle(firstBtnTitle, forState: .Normal)
    }
    
    func resetTimer() {
        
        //Reset the timer
        timer.invalidate()
        seconds = 3
        timerIsRunning = false
    }
    
    func showScoreBtnWithDelay(seconds seconds: Int) {
        
        //Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        
        //Calculates a time value to execute the method given current time and delay
        let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, delay)
        
        //Executes the nextRound method at the dispatch time on the main queue
        dispatch_after(dispatchTime, dispatch_get_main_queue()) {
            self.nextRoundBtn.hidden = true
            self.showScoreBtn.hidden = false
        }
    }
    
    //-----------------------
    //MARK: Timer
    //-----------------------
    func startTimer() {
        
        //Check if timer is running. If not then start timer
        if timerIsRunning == false {
            
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.countdown), userInfo: nil, repeats: true)
            timerIsRunning = true
        }
    }
    
    func countdown() {
        
        seconds -= 1
        
        if seconds == 0 {
            
            //If timer is 0, reset the timer and check the order of events
            resetTimer()
            checkAnswer()
        }
        
        timerLabel.text = "0:\(seconds)"
    }
    
    //-----------------------
    //MARK: Device motion
    //-----------------------
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        
        //Detect shake motion
        if motion == .MotionShake {
            
            resetTimer()
            checkAnswer()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showScore" {
            
            if let destinationVC = segue.destinationViewController as? ScoreViewController {
                
                destinationVC.correctAnswers = self.correctAnswers
            }
            
        }else if segue.identifier == "shoWebView" {
            
            if let destinationVC = segue.destinationViewController as? WebViewViewController {
                
                destinationVC.url = self.webUrl
            }
        }
    }
    
    @IBAction func unwind(unwindSegue: UIStoryboardSegue) {
        
        if unwindSegue.identifier == "unwindSegue" {
            
            //Set the game up if the user presses play again
            setUpGame()
        }
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

