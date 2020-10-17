//
//  CoffeeMapVC.swift
//  goodcoffee
//
//  Created by Trevor Pennington on 10/13/20.
//  Copyright © 2020 Trevor Pennington. All rights reserved.
//

import UIKit
import MapKit

class CoffeeMapVC: UIViewController, MKMapViewDelegate {
   
    
    let mapView = MKMapView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        renderAll()
    }
    
    func renderAll() {
        renderMapView()
    }
    
    func renderMapView() {
        mapView.showsUserLocation = true
        
        view.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapView.heightAnchor.constraint(equalTo: view.heightAnchor),
            mapView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }

}
