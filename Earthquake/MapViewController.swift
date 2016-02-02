//
//  MapViewController.swift
//  Earthquake
//
//  Created by Darrekk Hocking on 2/2/16.
//  Copyright © 2016 Darrekk Hocking. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate, UINavigationBarDelegate {
    var mapView: MKMapView!
    
    var latitude: Double!
    var longitude: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let location = CLLocationCoordinate2D(
            latitude: self.latitude,
            longitude: self.longitude
        )
        
        let span = MKCoordinateSpanMake(5, 5)
        let region = MKCoordinateRegion(center: location, span: span)
        
        mapView = MKMapView()
        mapView.mapType = .Standard
        mapView.frame = view.frame
        mapView.delegate = self
        mapView.setRegion(region, animated: true)
        view.addSubview(mapView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
