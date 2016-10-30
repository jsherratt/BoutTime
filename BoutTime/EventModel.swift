//
//  EventModel.swift
//  BoutTime
//
//  Created by Joe Sherratt on 19/06/2016.
//  Copyright © 2016 BlueFlameApps. All rights reserved.
//

import Foundation

//-----------------------
//MARK: Error types
//-----------------------
enum EventsError: Error {
    
    case InvalidResource
    case ConversionError
}

//-----------------------
//MARK: Classes
//-----------------------
class Events {
    
    let name:String
    let date:Int
    let url:String
    
    init(name:String, date: Int, url:String) {
        
        self.name = name
        self.date = date
        self.url = url
    }
}

//-----------------------
//MARK: Structs
//-----------------------
struct EventsQuiz {
    
    var events: [Events]
    
    init(events:[Events]) {
        
        self.events = events
    }
}

//-----------------------
//MARK: Helper Classes
//-----------------------
class PlistConverter {
    
    class func arrayFromFile(resource: String, ofType type: String) throws -> [[String : String]] {
        
        //Check if the path to the file exists
        guard let path = Bundle.main.path(forResource: resource, ofType: type) else {
            throw EventsError.InvalidResource
        }
        
        //Try and cast as an array
        guard let array = NSArray(contentsOfFile: path),
            let castArray = array as? [[String: String]] else {
                throw EventsError.ConversionError
        }
        return castArray
    }
}

class EventsUnarchiver {
    
    class func eventsFromArray(array: [[String : String]]) -> [Events] {
        
        var eventArray: [Events] = []
        
        for event in array {
            
            //Create and append a new event for each event in the array of events
            if let name = event["name"],
                let date = event["date"],
                let dateAsInt = Int(date),
                let url = event["url"] {
                let newEvent = Events(name: name, date: dateAsInt, url: url)
                eventArray.append(newEvent)
            }
        }
        
        return eventArray
    }
}














