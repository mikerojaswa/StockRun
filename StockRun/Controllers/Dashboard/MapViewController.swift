//
//  MapViewController.swift
//  StockRun
//
//  Created by Michael Rojas on 4/22/18.
//  Copyright © 2018 Michael Rojas. All rights reserved.
//

import UIKit
import MapKit

struct stockLocs {
    let stock: Stock
    let coordinate: CLLocationCoordinate2D
}

class MapViewController: UIViewController {
    @IBOutlet var mapView: MKMapView!
    var stocks: [Stock]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stocks = DataSource.shared.getUserStocks()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupMap()
    }
    
    fileprivate func setupMap() {
        var stockLocks: [stockLocs] = []
        if let stocks = stocks {
            let serviceGroup = DispatchGroup()
            for item in stocks {
                serviceGroup.enter()
                CLGeocoder().geocodeAddressString(item.companyName, completionHandler: { (placemarks, error) in
                    serviceGroup.leave()
                    if let placemarks = placemarks {
                        if let coordinate = (placemarks[0].location?.coordinate) {
                            let stockboi = stockLocs.init(stock: item, coordinate: coordinate)
                            stockLocks.append(stockboi)
                        }
                    }
                })
            }
            serviceGroup.notify(queue: DispatchQueue.main) {
                self.addSomeAnnobois(stocks: stockLocks)
            }
        }
    }
    
    fileprivate func addSomeAnnobois(stocks: [stockLocs]) {
        mapView.removeAnnotations(mapView.annotations)
        for item in stocks {
            let annotation = MKPointAnnotation()
            let coord = CLLocationCoordinate2D.init(latitude: item.coordinate.latitude, longitude: item.coordinate.longitude)
            annotation.coordinate = coord
            annotation.title = String(item.stock.companyName)
            self.mapView.addAnnotation(annotation)
        }
        
        if let coordinate = mapView.annotations.first {
            let region = MKCoordinateRegionMakeWithDistance(coordinate.coordinate, 2000 * 1609.34, 2000 * 1609.34)
            mapView.region = region
        }
    }
}
