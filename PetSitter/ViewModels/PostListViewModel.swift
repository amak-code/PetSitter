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
    

    
  @Published var posts: [Post] = [
    Post(nameFirst: "Meggie",nameLast: "Johns", likesCount: 40, phone: "415-333-0000", email: "aaa@gmail.com", picture: "sitter_2", zipcode: "97123", price: 25, textPost: "Hi, My name is Meggie and I like dogs and cats. I can take care of them very well. I'm flexible with the hours and price.", location: Location(latitude: 37.795162, longitude: -122.402728)),
   Post(nameFirst: "John", nameLast: "Smith",likesCount: 35, phone: "415-333-0000", email: "aaa@gmail.com", picture: "sitter_1", zipcode: "97123", price: 35, textPost: "Hi, My name is Meggie and I like dogs and cats. I can take care of them very well. I'm flexible with the hours and price.", location: Location(latitude: 37.7897, longitude: -122.3972))]
    
    
    
    func createPost(post: Post){
        let petsitter = post
        posts.append(petsitter)
        saveToPersistanceStore()
        
    }
    
    func deletePost(indexSet: IndexSet){
        posts.remove(atOffsets: indexSet)
        saveToPersistanceStore()
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
