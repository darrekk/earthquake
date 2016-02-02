//
//  EarthquakeViewController.swift
//  Earthquake
//
//  Created by Darrekk Hocking on 2/1/16.
//  Copyright © 2016 Darrekk Hocking. All rights reserved.
//

import UIKit
import PureLayout

class EarthquakeViewController: UITableViewController {
    
    var dataSource: EarthquakeTableViewDataSource?
    
    func fetchEarthquakes(){
        EarthquakeEndpoint().earthquakeRequest(){ (earthquakeValues, error) -> Void in
            if let someError = error{
                let alertController = UIAlertController(title: someError.localizedDescription , message:"Could not load earthquake data." , preferredStyle: UIAlertControllerStyle.Alert)
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
        
        for earthquake in earthquakes{
            let earthquakeObject = Earthquake(earthquakeData: earthquake as! NSDictionary)
            dataSource?.addEarthquake(earthquakeObject)
            dispatch_async(dispatch_get_main_queue(),{
                self.tableView?.reloadData()
            })
        }
    }
    

    override func viewDidLoad() {
        fetchEarthquakes()
        
        tableView.dataSource = dataSource
        dataSource?.registerCellsForTableView(tableView)
        tableView.allowsSelection = false
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 65;
        self.tableView.separatorStyle = .SingleLine
    }
}

