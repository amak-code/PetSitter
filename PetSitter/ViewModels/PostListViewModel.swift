//
//  PostListViewModel.swift
//  PetSitter
//
//  Created by antikiller on 17.07.2022.
//

import Foundation
import SwiftUI
import MapKit
import FirebaseDatabase

class PostListViewModel: ObservableObject {
    
    static var shared = PostListViewModel()

    
    @Published var posts: [Post] = []
    
    @Published var filteredPosts: [Post] = []
    
    private lazy var databasePath: DatabaseReference? = {
        
            let ref = Database.database().reference().child("posts")
            
        
            return ref
        }()
        
        private let encoder = JSONEncoder()
        private let decoder = JSONDecoder()
        
        func listentoRealtimeDatabase() {
            guard let databasePath = databasePath else {
                return
            }
            self.posts = []
            databasePath
                .observe(.childAdded) { [weak self] snapshot in
                    guard
                        let self = self,
                        var json = snapshot.value as? [String: Any]
                    else {
                        return
                    }
                    json["id"] = snapshot.key
                    do {
                        let postData = try JSONSerialization.data(withJSONObject: json)
                        let post = try self.decoder.decode(Post.self, from: postData)
                        let postDate = post.date
                        let expirationDate = postDate.addingTimeInterval(2592000)
                        let currentDate = Date()
                        let range = postDate...currentDate
                        if range.contains(expirationDate){
                            Database.database().reference().child("posts").child(post.id).removeValue(completionBlock: {(error, result) in
                                if error != nil {
                                        // failed to delete post
                                    }
                                    else {
                                        print("Post was deleted!")
                                    }
                            })
                        }
                        self.posts.append(post)
                    } catch {
                        print("an error occurred", error)
                    }
                }
        }
        
        func stopListening() {
            databasePath?.removeAllObservers()
        }
    
    func createPost(post: Post){
        
        guard databasePath != nil else {
          return
        }

        do {
          
          let data = try encoder.encode(post)

          let json = try JSONSerialization.jsonObject(with: data)

            databasePath?.childByAutoId()
            .setValue(json)
        } catch {
          print("an error occurred", error)
        }
        
//        if post.isEmpty {
//          return
//        }


    }
//
    func likePost(post: Post)  {
        if let i = posts.firstIndex(where: {p in p.id == post.id}){
            posts[i].likesCount =  posts[i].likesCount + 1

        }
  

    }
//
//    func getPostById(id: String)-> Post? {
//
//        return posts.first(where: {post in post.id == id})
//    }
//
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
//
//
//    func updateFilteredPosts(posts: [Post]) -> [Post]{
//        self.posts = posts.sorted { (post1, post2) -> Bool in
//            return post1.price < post2.price
//        }
//        return posts
//    }
//
    //MARK: - PersistanceStore
    
    
//    func createPersistanceStore()-> URL{
//        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        let fileurl = url[0].appendingPathComponent("Post.json")
//        return fileurl
//    }
//
//    func saveToPersistanceStore(){
//        do{
//            let data = try JSONEncoder().encode(posts)
//            try data.write(to: createPersistanceStore())
//        } catch {
//            print("Error encoding!")
//        }
//    }
//
//    func loadFromPersistanceStore(){
//        do{
//            let data = try Data(contentsOf: createPersistanceStore())
//
//            posts = try JSONDecoder().decode([Post].self, from: data)
//        } catch{
//            print("Error decoding our data.")
//        }
//    }
//
//
    
}
