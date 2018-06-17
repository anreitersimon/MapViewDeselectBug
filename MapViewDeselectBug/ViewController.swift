//
//  ViewController.swift
//  MapViewDeselectBug
//
//  Created by Simon Anreiter on 15.06.18.
//  Copyright © 2018 imobility. All rights reserved.
//

import UIKit
import MapKit

class A: MKMarkerAnnotationView {
    
    override var isSelected: Bool {
        didSet {
            print(#function, isSelected)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        print(#function, selected, animated)
    }
    
    
    override func prepareForDisplay() {
        super.prepareForDisplay()
        print(#function)
    }
}

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.register(A.self, forAnnotationViewWithReuseIdentifier: "A")
        mapView.delegate = self
        
        for _ in 0...20 {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(
                latitude: Double.random(in: 48...49),
                longitude: Double.random(in: 16...17)
            )
            
            mapView.addAnnotation(annotation)
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let a = mapView.dequeueReusableAnnotationView(withIdentifier: "A", for: annotation) as! MKMarkerAnnotationView
        a.animatesWhenAdded = true
        a.clusteringIdentifier = nil
        a.displayPriority = .defaultHigh
        
        return a
    }


}

