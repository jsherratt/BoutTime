//
//  EventModel.swift
//  BoutTime
//
//  Created by Joe Sherratt on 19/06/2016.
//  Copyright © 2016 BlueFlameApps. All rights reserved.
//

import Foundation

class EventModel {
    
    let title:String
    let date:Int
    let url:String
    
    init(title:String, date: Int, url:String) {
        
        self.title = title
        self.date = date
        self.url = url
    }
}
