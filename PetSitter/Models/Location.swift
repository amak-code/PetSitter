//
//  Location.swift
//  PetSitter
//
//  Created by antikiller on 14.07.2022.
//

import Foundation
import CoreLocation

struct Location: Identifiable {
    let id = UUID()
    let name: String?
    let coordinate: CLLocationCoordinate2D
}
