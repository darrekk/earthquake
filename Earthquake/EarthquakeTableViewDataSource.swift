//
//  File.swift
//  Earthquake
//
//  Created by Darrekk Hocking on 2/1/16.
//  Copyright © 2016 Darrekk Hocking. All rights reserved.
//

import UIKit


class EarthquakeTableViewDataSource: NSObject, UITableViewDataSource{
    private var earthquakes = [Earthquake]()
    private var formatter = Formatter()
    private let cellIdentifier = "Cell"

    
    func registerCellsForTableView(tableView: UITableView) {
            tableView.registerClass(EarthquakeTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return earthquakes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! EarthquakeTableViewCell
        
        let earthquake = earthquakes[indexPath.row]
        let magnitude = earthquake.magnitude
        if magnitude >= 8 {
            cell.magnitudeLabel.textColor = .redColor()
        }
        else{
            cell.magnitudeLabel.textColor = .blackColor()
        }
        
        cell.dateTimeLabel.text = formatter.dateTime(earthquake.dateTimeString)
        cell.magnitudeLabel.text = String(format:"%.1f",magnitude)
        cell.coordinateLabel.text = "Lat: \(String(format:"%.4f", earthquake.latitude)) Long: \(String(format:"%.4f",earthquake.longitude))"
        
        cell.setNeedsUpdateConstraints()
        cell.updateConstraintsIfNeeded()
        
        return cell
    }
}

extension EarthquakeTableViewDataSource{
    func addEarthquake(earthquake: Earthquake){
        earthquakes.append(earthquake)
    }
    func removeEarthquakes(){
        earthquakes.removeAll()
    }
    func getEarthquake(row: Int)->Earthquake{
        return earthquakes[row]
    }
}