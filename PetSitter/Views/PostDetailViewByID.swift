//
//  PostDetailViewByID.swift
//  PetSitter
//
//  Created by antikiller on 10/13/22.
//

import SwiftUI



struct PostDetailViewByID: View {
    
    var postID: String
    
    
    @ObservedObject var viewModel = PostListViewModel.shared

    
    var body: some View {
        let p = viewModel.posts.first(where: {post in post.id == postID})
        
        if let post = p {
            PostDetailView(petSitter: post)
        }
        
        
    }

    
}

