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
        
        let newDateTime = dateFormatter.dateFromString(dateTime)

        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        
        let calendar = NSCalendar.currentCalendar()
        let comp = calendar.components([.Hour, .Minute], fromDate: newDateTime!)
        let hour = comp.hour
        let minute = comp.minute
        
        return ("\(dateFormatter.stringFromDate(newDateTime!)) \(hour):\(minute)")
    }
}