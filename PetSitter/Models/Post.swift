//
//  Post.swift
//  PetSitter
//
//  Created by antikiller on 12.07.2022.
//

import Foundation
import UIKit
import CoreLocation


struct Post: Identifiable, Codable {
   
    var id = UUID().uuidString
    var nameFirst: String
    var nameLast: String
    var likesCount: Int = 0
    var phone: String
    var email: String
    var picture: String 
    var zipcode: String
    var price: Int
    var textPost: String
    var date:Date = Date()
    var location: Location
    

}

