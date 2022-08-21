//
//  PostListViewModel.swift
//  PetSitter
//
//  Created by antikiller on 17.07.2022.
//

import Foundation
import SwiftUI
import MapKit

class PostListViewModel: ObservableObject {
    
    static var shared = PostListViewModel()
    init() {
      loadFromPersistanceStore()
        if posts.count != 0{
            
            for (i, _) in posts.enumerated().reversed() {
                deletePost(index: i)
            }
            
            saveToPersistanceStore()
        }
     //loadFromPersistanceStore()
       
    }
    
    
    @Published var posts: [Post] = []
    
    @Published var filteredPosts: [Post] = []
    
    func createPost(post: Post){
        let petsitter = post
        posts.append(petsitter)
        saveToPersistanceStore()
        
    }
    
    func deletePost(index: Int){
        let post = posts[index]
        let postDate = post.date
        let expirationDate = postDate.addingTimeInterval(2592000)
        let currentDate = Date()
        let range = postDate...currentDate
        if range.contains(expirationDate){
            posts.remove(at: index)
        }
        
    }
    
    
    func updateFilteredPosts(posts: [Post]) -> [Post]{
        self.posts = posts.sorted { (post1, post2) -> Bool in
            return post1.price < post2.price
        }
        return posts
    }
    
    //MARK: - PersistanceStore
    
    
    func createPersistanceStore()-> URL{
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileurl = url[0].appendingPathComponent("Post.json")
        return fileurl
    }
    
    func saveToPersistanceStore(){
        do{
            let data = try JSONEncoder().encode(posts)
            try data.write(to: createPersistanceStore())
        } catch {
            print("Error encoding!")
        }
    }
    
    func loadFromPersistanceStore(){
        do{
            let data = try Data(contentsOf: createPersistanceStore())
            
            posts = try JSONDecoder().decode([Post].self, from: data)
        } catch{
            print("Error decoding our data.")
        }
    }
    
    
    
}
