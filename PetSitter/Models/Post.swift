//
//  Post.swift
//  PetSitter
//
//  Created by antikiller on 12.07.2022.
//

import Foundation
import UIKit

struct Post: Identifiable {
   
    let id = UUID()
    var name: String
    var phone: String
    var email: String
    var picture: String?
    var zipcode: Int
    var price: Int
    var textPost: String
    var location: Location
}
