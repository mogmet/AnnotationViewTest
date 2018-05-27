//
//  ViewController.swift
//  AnnotationViewTest
//
//  Created by mogmet on 2018/05/27.
//  Copyright © 2018年 mogmet. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    private let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
    private let annotations = [
        ShopAnnotation(Shop(shopName: "ほげ", branchName: "大阪本社", latitude: 34.705563, longitude: 135.494851)),
        ShopAnnotation(Shop(shopName: "ほげ", branchName: "東京支社", latitude: 35.625018, longitude: 139.721239)),
        ShopAnnotation(Shop(shopName: "ほげほげ", branchName: "名古屋支社", latitude: 35.174341, longitude: 136.912334)),
        ShopAnnotation(Shop(shopName: "ほげほげ", branchName: "島根支社", latitude: 35.474979, longitude: 133.067409))
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        mapView.addAnnotations(annotations)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let shopAnnotation = sender as? ShopAnnotation,
        let shopDetailVC = segue.destination as? ShopDetailViewController else { return }
        shopDetailVC.shop = shopAnnotation.shop
    }
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier, for: annotation)
        guard let markerAnnotationView = annotationView as? MKMarkerAnnotationView,
            let shopAnnotation = annotation as? ShopAnnotation else { return annotationView }
       configureMarkerAnnotationView(markerAnnotationView: markerAnnotationView, shopAnnotation: shopAnnotation)
        return markerAnnotationView
    }
    
    private func configureMarkerAnnotationView(markerAnnotationView: MKMarkerAnnotationView, shopAnnotation: ShopAnnotation) {
        markerAnnotationView.clusteringIdentifier = ShopAnnotation.clusteringIdentifier
        markerAnnotationView.canShowCallout = true
        markerAnnotationView.glyphText = shopAnnotation.title
        markerAnnotationView.calloutOffset = CGPoint(x: -5, y: 5)
        markerAnnotationView.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        markerAnnotationView.annotation = shopAnnotation
        let detailLabel = UILabel()
        detailLabel.numberOfLines = 0
        detailLabel.font = detailLabel.font.withSize(12)
        detailLabel.text = shopAnnotation.subtitle
        markerAnnotationView.detailCalloutAccessoryView = detailLabel
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView,                 calloutAccessoryControlTapped control: UIControl) {
        guard let shopAnnotaion = view.annotation as? ShopAnnotation else { return }
        performSegue(withIdentifier: "Segue", sender: shopAnnotaion)
    }

}
