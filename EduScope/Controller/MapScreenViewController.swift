//
//  MapScreenViewController.swift
//  EduScope
//
//  Created by Krish Patel on 3/2/24.
//

import UIKit
import MapKit

class MapScreenViewController: UIViewController {

    var latitudeString: String?
    var longitudeString: String?
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var centerCoordinate = CLLocationCoordinate2D(latitude: 37.3317, longitude: -122.0307) // Default to Cupertino headquarters
            
        if let latitude = latitudeString, let longitude = longitudeString {
            if let lat = CLLocationDegrees(latitude), let long = CLLocationDegrees(longitude) {
                centerCoordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
            }
        }
        
        // Set center to the given coordinates
        mapView.setCenter(centerCoordinate, animated: true)
        
        // Define the region to zoom in
        let region = MKCoordinateRegion(center: centerCoordinate, latitudinalMeters: 1000, longitudinalMeters: 1000) // Adjust the meters as per your preference
        mapView.setRegion(region, animated: true)
        
        // Add a pin at the center
        let annotation = MKPointAnnotation()
        annotation.coordinate = centerCoordinate
        mapView.addAnnotation(annotation)
    }

}
