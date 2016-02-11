//
//  Formatter.swift
//  Earthquake
//
//  Created by Darrekk Hocking on 2/1/16.
//  Copyright © 2016 Darrekk Hocking. All rights reserved.
//

import Foundation

class Formatter{
    func dateTime(dateTime: String)->String{
        let dateFormatter = NSDateFormatter()        

        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        let dateTime = dateFormatter.dateFromString(dateTime)
        
        dateFormatter.dateFormat = "yyyy-MM-dd h:mm"
        
        let newStringDateTime = dateFormatter.stringFromDate(dateTime!)
        
        let newDateTime = dateFormatter.dateFromString(newStringDateTime)
        
        
        
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        
        return ("\(dateFormatter.stringFromDate(newDateTime!))")
    }
    func coordinates(latitude: Double, longitude: Double)->NSDictionary{
        let north = latitude + 27
        let south = latitude - 27
        let west = longitude - 38
        let east = longitude + 38
        
        return ["north":north, "south":south,"west":west,"east":east]
    }
}