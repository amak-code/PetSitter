//
//  SearchResultsListView.swift
//  PetSitter
//
//  Created by antikiller on 19.07.2022.
//

import SwiftUI
import MapKit

struct SearchResultsListView: View {
    

    var firstName: String
    var lastName: String
    var pricePerHour: String
    var zipCode: String

    @ObservedObject var viewModel = PostListViewModel.shared
    @State private var viewDidLoad = false

    var body: some View {
        
        VStack {
            
            List(filterListPosts(posts: viewModel.posts), id: \.id) {petSitter in
                
                NavigationLink(destination: PostDetailView(petSitter: petSitter), label: {
                    
                    HStack{
                        Image(uiImage: petSitter.picture.toImage())
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 90)
                            .cornerRadius(4)
                            .padding(.vertical)
                        // .background(.yellow)
                        
                        VStack(alignment: .leading, spacing: 3){
                            
                            HStack {
                                
                                Text(petSitter.nameFirst)
                                
                                    .font(.system(size: 17, weight: .semibold))
                                Text(petSitter.nameLast)
                                    .font(.system(size: 17, weight: .semibold))
                                Label("\(petSitter.likesCount)", systemImage: "heart")
                                
                            }
                            Text("\(petSitter.price) $")
                                .font(.subheadline)
                                .font(.system(size: 15, weight: .semibold))

                            Text("About myself: \(petSitter.textPost) ")
                                .font(.system(size: 14, weight: .light))
                                .lineLimit(4)
                                .minimumScaleFactor(0.5)
                                
                            
                        }//VSTAck
                        
                        
                        
                    }//Hstack
                    
                })//NavigationLink
                
            }
            .listStyle(.plain)
            // .navigationTitle("Results of your search")
            
        }//Vstack
        .onAppear{
            if viewDidLoad == false {
                
                viewDidLoad = true
                viewModel.listentoRealtimeDatabase()
                
                }
                
            }
        
        .onDisappear{
            viewModel.stopListening()
        }
//        
    }
}



extension SearchResultsListView {
    
    func filterListPosts(posts: [Post]) -> [Post] {
        
        //working with cases when user didn't input all the data
        
        if firstName == "" && lastName == "" && pricePerHour == "" && zipCode == "" {
            
           // sorting all the posts
            let allPosts = posts.sorted {
                (post1, post2) -> Bool in
                    return post1.price < post2.price
            }
            
            return allPosts
        }
        
        let filteredPosts = posts.filter({ (post) in
            
            if firstName != "" && lastName != "" && pricePerHour != "" && zipCode != "" {
                
                return post.nameFirst == firstName && post.nameLast == lastName && post.price <= Int(pricePerHour) ?? 100000 && post.zipcode == zipCode
            }
            
           else if firstName != "" && lastName != "" && pricePerHour != ""{
                
                return post.nameFirst == firstName && post.nameLast == lastName && post.price <= Int(pricePerHour) ?? 100000
            }
            
            
            else if firstName != "" && lastName != "" && zipCode != "" {
                return post.nameFirst == firstName && post.nameLast == lastName && post.zipcode == zipCode
            }
            
            else if firstName != "" && lastName != "" {
                return post.nameFirst == firstName && post.nameLast == lastName
            }
            
            else if   lastName != "" && pricePerHour != "" {
                
                return post.nameLast == lastName && post.price <= Int(pricePerHour) ?? 100000
                
            }
            
            else if  lastName != "" && pricePerHour != "" && zipCode != "" {
                
                return post.nameLast == lastName && post.price <= Int(pricePerHour) ?? 100000 && post.zipcode == zipCode
            }
            
            
           else if firstName != "" && pricePerHour != "" && zipCode != "" {
                
                return post.nameFirst == firstName && post.price <= Int(pricePerHour) ?? 100000 && post.zipcode == zipCode
            }
            
            else if pricePerHour != "" && zipCode != "" {
                 
                 return post.price <= Int(pricePerHour) ?? 100000 && post.zipcode == zipCode
             }
            
           else if firstName != "" && zipCode != "" {
                
                return post.nameFirst == firstName && post.zipcode == zipCode
            }
            
           else if firstName != "" && pricePerHour != "" {
                
                return post.nameFirst == firstName && post.price <= Int(pricePerHour) ?? 100000
            }
            
          else if lastName != "" && zipCode != "" {
                
                return post.nameLast == lastName && post.zipcode == zipCode
            }
            
            else if zipCode != "" {
                  
                  return post.zipcode == zipCode
              }
            
            else if firstName != ""  {
                 
                 return post.nameFirst == firstName
             }
            
            else if pricePerHour != "" {
                 
                 return post.price <= Int(pricePerHour) ?? 100000
             }
           
                return post.nameLast == lastName
                
        })  //sorting filtered posts
            .sorted { (post1, post2) -> Bool in
                return post1.price < post2.price
            }
        return filteredPosts
    }
    
}
