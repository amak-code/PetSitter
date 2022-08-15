//
//  Location.swift
//  PetSitter
//
//  Created by antikiller on 14.07.2022.
//

import Foundation
import CoreLocation

struct Location: Identifiable, Codable {
    
    var id = UUID().uuidString
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D{
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
   
    

}
