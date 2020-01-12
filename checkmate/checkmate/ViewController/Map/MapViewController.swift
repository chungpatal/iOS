//
//  MapViewController.swift
//  checkmate
//
//  Created by 강수진 on 2020/01/03.
//  Copyright © 2020 강수진. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, MTMapViewDelegate, NibLoadable {
    private var mapView: MTMapView?
    private var poiItem: MTMapPOIItem?
    var geo: (lat: Double, long: Double)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
        // create mapView
        mapView = MTMapView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        mapView?.delegate = self
    
        if let mapView = mapView {
            view.addSubview(mapView)
            if let geo = geo {
                showCustosmMarker(geo: geo)
            }
        }
    }
    
//    func _showDefaultMarker() {
//        poiItem1 = MTMapPOIItem()
//        poiItem1?.itemName = "Default Marker"
//        poiItem1?.markerType = .bluePin
//        poiItem1?.showDisclosureButtonOnCalloutBalloon = true
//        poiItem1?.markerSelectedType = .redPin
//        poiItem1?.showAnimationType = .dropFromHeaven
//        poiItem1?.mapPoint = MTMapPoint(geoCoord: MTMapPointGeo(latitude: 37.402110, longitude: 127.108451))
//        mapView?.addPOIItems([poiItem1])
//        mapView?.fitArea(toShowMapPoints: [poiItem1?.mapPoint])
//    }

    func showCustosmMarker(geo: (lat: Double, long: Double)) {
        poiItem = MTMapPOIItem()
        poiItem?.itemName = "태영 빌딩"
        poiItem?.markerType = .customImage
        poiItem?.customImageName = "iconMap"
        let point = MTMapPointGeo(latitude: geo.lat, longitude: geo.long)
        poiItem?.mapPoint = MTMapPoint(geoCoord: point)
        poiItem?.showAnimationType = .springFromGround
        poiItem?.customImageAnchorPointOffset = MTMapImageOffset(offsetX: 30, offsetY: 0)
        mapView?.addPOIItems([poiItem])
        mapView?.setMapCenter(MTMapPoint(geoCoord: point), animated: true)
        mapView?.fitArea(toShowMapPoints: [poiItem?.mapPoint])
    }
}
