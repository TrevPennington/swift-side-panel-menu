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
    let searchButton = UIButton()
    let addCoffeeButton = UIButton()
    
    let searchButtonImage = UIImage(systemName: "magnifyingglass.circle", withConfiguration: UIImage.SymbolConfiguration(scale: .large))
    let addCoffeeButtonImage = UIImage(systemName: "plus.circle", withConfiguration: UIImage.SymbolConfiguration(scale: .large))

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        renderAll()
    }
    
    func renderAll() {
        renderMapView()
        renderSearch()
        renderAddCoffee()
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
    
    func renderSearch() {
        view.addSubview(searchButton)
        searchButton.setImage(searchButtonImage, for: .normal)
        searchButton.tintColor = .systemGray
        
        
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            searchButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
        ])
    }
    
    func renderAddCoffee(){
        view.addSubview(addCoffeeButton)
        addCoffeeButton.setImage(addCoffeeButtonImage, for: .normal)
        addCoffeeButton.tintColor = .systemGray
        
        addCoffeeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addCoffeeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            addCoffeeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }

}
