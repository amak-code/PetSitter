//
//  DataSource.swift
//  PetSitter
//
//  Created by antikiller on 14.07.2022.
//

import Foundation
import MapKit

class DataSource {
    
    var locations: [Location] {
        
      var first =  Location(name: "First sitter", coordinate: CLLocationCoordinate2D(latitude: 37.795162, longitude: -122.402728));
      var second = Location(name: "Second sitter", coordinate: CLLocationCoordinate2D(latitude: 37.7897, longitude: -122.3972))
        
        return [first, second]
    }
    
}

