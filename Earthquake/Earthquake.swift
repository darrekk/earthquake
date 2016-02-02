//
//  Earthquake.swift
//  Earthquake
//
//  Created by Darrekk Hocking on 2/1/16.
//  Copyright © 2016 Darrekk Hocking. All rights reserved.
//

import Foundation

class Earthquake: NSObject{
    var latitude: Double
    var longitude: Double
    var magnitude: Double
    var dateTimeString: String
    
    init(earthquakeData: NSDictionary){
        self.latitude = earthquakeData.objectForKey("lat") as! Double
        self.longitude = earthquakeData.objectForKey("lng") as! Double
        self.magnitude = earthquakeData.objectForKey("magnitude") as! Double
        self.dateTimeString = earthquakeData.objectForKey("datetime") as! String

    }
}
