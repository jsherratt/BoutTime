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
    
    //-----------------------
    //MARK: Outlets
    //-----------------------
    
    //Views
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    
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
    
    //-----------------------
    //MARK: View
    //-----------------------
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //-----------------------
    //MARK: Button Actions
    //-----------------------
    
    
    //-----------------------
    //MARK: Extra
    //-----------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

