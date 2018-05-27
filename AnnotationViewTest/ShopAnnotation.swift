//
//  ShopAnnotation
//  AnnotationViewTest
//
//  Created by mogmet on 2018/05/27.
//  Copyright © 2018年 mogmet. All rights reserved.
//

import Foundation
import MapKit

class ShopAnnotation: NSObject, MKAnnotation {
    static let clusteringIdentifier = "Shop"
    let coordinate: CLLocationCoordinate2D
    let title: String?
    let subtitle: String?
    let shop: Shop
    
    init(_ shop: Shop) {
        self.title = shop.shopName
        self.subtitle = shop.branchName
        self.coordinate = CLLocationCoordinate2D(latitude: shop.latitude, longitude: shop.longitude)
        self.shop = shop
        super.init()
    }
}
