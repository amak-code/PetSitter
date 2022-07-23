//
//  PostListViewModel.swift
//  PetSitter
//
//  Created by antikiller on 17.07.2022.
//

import Foundation
import SwiftUI

class PostListViewModel: ObservableObject {
    
  @Published var posts: [Post] = []
    
    func createPost(post: Post){
        let petsitter = post
        posts.append(petsitter)
        
    }
    
}
