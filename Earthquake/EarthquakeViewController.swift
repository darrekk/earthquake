//
//  EarthquakeViewController.swift
//  Earthquake
//
//  Created by Darrekk Hocking on 2/1/16.
//  Copyright © 2016 Darrekk Hocking. All rights reserved.
//

import UIKit
import PureLayout
import CoreLocation

class EarthquakeViewController: UITableViewController, CLLocationManagerDelegate {
    
    var dataSource: EarthquakeTableViewDataSource?
    var navBarButton: UIBarButtonItem?
    var isLocation: Bool = false
    var isRunningSimulator: Bool?
    let locationManager = CLLocationManager()
    let formatter = Formatter()
    
    
    func fetchEarthquakes(coordinates: NSDictionary = ["north":44.1, "south":-9.9,"east":-22.4, "west":55.2]){
        EarthquakeEndpoint().earthquakeRequest(coordinates){ (earthquakeValues, error) -> Void in
            if let someError = error{
                let alertController = UIAlertController(title: someError.localizedDescription, message:"Could not load earthquake data." , preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
            else if let someEarthquakeValues = earthquakeValues{
                self.makeEarthquakes(someEarthquakeValues)
            }
        }
    }
    func makeEarthquakes(earthquakeValues: AnyObject){
        let earthquakes = earthquakeValues["earthquakes"] as! NSArray
        dataSource?.removeEarthquakes()
        for earthquake in earthquakes{
            let earthquakeObject = Earthquake(earthquakeData: earthquake as! NSDictionary)
            dataSource?.addEarthquake(earthquakeObject)
            dispatch_async(dispatch_get_main_queue(),{
                self.tableView?.reloadData()
            })
        }
    }
    func swapLocation(){
        if(CLLocationManager.locationServicesEnabled() && self.isLocation == false){
            if(isRunningSimulator == true){
                self.fetchEarthquakes()
                self.isLocation = true
            }
            else{
                self.locationManager.startUpdatingLocation()
            }
            
        }
        else{
            self.fetchEarthquakes()
            self.isLocation = false
        }
    }
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locationArray = locations as NSArray
        let locationObj = locationArray.lastObject as! CLLocation
        let coord = locationObj.coordinate
        self.isLocation = true
        self.fetchEarthquakes(formatter.coordinates(coord.latitude, longitude: coord.longitude))
        self.locationManager.stopUpdatingLocation()
        
    }

    override func viewDidLoad() {
        if(TARGET_OS_SIMULATOR != 0){
            isRunningSimulator = true
        }else{
            navBarButton = UIBarButtonItem(title: "Swap Location", style: .Plain, target: self, action: "swapLocation")
            self.navigationItem.setRightBarButtonItem(navBarButton, animated: true)
        }
        
        
        tableView.dataSource = dataSource
        dataSource?.registerCellsForTableView(tableView)
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 65;
        self.tableView.separatorStyle = .SingleLine
        
        
        locationManager.delegate = self
        
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            if(isRunningSimulator == true){
                //Use defualt location
                self.fetchEarthquakes()
                self.isLocation = true
            }
            else{
                //Use devices coordinates
                self.locationManager.delegate = self
                self.locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
                self.locationManager.startUpdatingLocation()

            }
        }
        else{
            //load data from pre-set location if location services turned off
            fetchEarthquakes()
            self.isLocation = false
        }
        
        //load data from pre-set location if still waiting for authorization
        if CLLocationManager.authorizationStatus() == CLAuthorizationStatus.NotDetermined {
            isLocation = false
            fetchEarthquakes()
        }
        
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let earthquake = dataSource?.getEarthquake(indexPath.row)
        let mapViewController = MapViewController()
        mapViewController.latitude = earthquake?.latitude
        mapViewController.longitude = earthquake?.longitude
        navigationController!.pushViewController(mapViewController, animated: true)
        
        
    }
}

