//
//  EarthquakeEndpoint.swift
//  Earthquake
//
//  Created by Darrekk Hocking on 2/1/16.
//  Copyright © 2016 Darrekk Hocking. All rights reserved.
//

import Foundation

typealias earthquakeRequestHandler = (earthquakeValues: AnyObject?, error: NSError?) -> Void

class EarthquakeEndpoint{
    
    
    func earthquakeRequest(coordinates: NSDictionary, completionHandler: earthquakeRequestHandler){
        let earthquakeEndpoint: String = "http://api.geonames.org/earthquakesJSON?formatted=true&north=\(coordinates.objectForKey("north")!.stringValue)&south=\(coordinates.objectForKey("south")!.stringValue)&east=\(coordinates.objectForKey("east")!.stringValue)&west=\(coordinates.objectForKey("west")!.stringValue)&username=mkoppelman"
        
        if let url = NSURL(string: earthquakeEndpoint){
            
            let urlRequest = NSMutableURLRequest(URL: url)
            let urlSession = NSURLSession(configuration: NSURLSessionConfiguration.ephemeralSessionConfiguration())
            let dataTask = urlSession.dataTaskWithRequest(urlRequest, completionHandler: {(data: NSData?, urlResponse: NSURLResponse?, error: NSError?) -> Void in
                if let earthquakeData = data, let someResponse = urlResponse as? NSHTTPURLResponse where someResponse.statusCode == 200{
                    do{
                        let earthquakeValues = try NSJSONSerialization.JSONObjectWithData(earthquakeData, options: [])
                        completionHandler(earthquakeValues: earthquakeValues, error: nil)
                    }
                    catch let error {
                        self.finishWithError(error as NSError, completionHandler: completionHandler)
                    }
                }
                else{
                    if let someError = error{
                        self.finishWithError(someError, completionHandler: completionHandler)
                    }
                    else{
                        self.finishWithRequestErrorWithMessage("The request failed.", completionHandler: completionHandler)
                    }
                }
            })
            dataTask.resume()
        }
    }
    private func finishWithError(error: NSError, completionHandler: earthquakeRequestHandler) {
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            completionHandler(earthquakeValues: nil, error: error)
        })
    }
    private func finishWithRequestErrorWithMessage(message: String, completionHandler: earthquakeRequestHandler) {
        let userInfo = [NSLocalizedDescriptionKey : message]
        let error = NSError(domain: EarthquakeEndpoint.ErrorDomain, code: EarthquakeEndpoint.ErrorCode.RequestError.rawValue, userInfo: userInfo)
        
        finishWithError(error, completionHandler: completionHandler)
    }
    static let ErrorDomain = "com.DarrekkHocking.Earthquake.EarthquakeEndpoint"
    enum ErrorCode: Int {
        case RequestError = 1
    }
    
}