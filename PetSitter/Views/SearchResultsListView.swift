//
//  SearchResultsListView.swift
//  PetSitter
//
//  Created by antikiller on 19.07.2022.
//

import SwiftUI
import MapKit

struct SearchResultsListView: View {
    
    @ObservedObject var postViewModel = PostListViewModel()
//    init(){
//           UITableView.appearance().backgroundColor = .clear
//       }
//    var posts:[Post] = PetSitterController.shared.petsitters
    
    var body: some View {
        
        List(postViewModel.posts, id: \.id) {petSitter in
            
            NavigationLink(destination: PostDetailView(petSitter: petSitter), label: {
                
                
                HStack{
                    Image(petSitter.picture ?? "figure.walk")
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
                        Text("Body text: a bit about myself Body text: a bit about myself Body text: a bit about myself Body text: a bit about myself Body text: a bit about myself Body text: a bit about myself Body text: a bit about myself ")
                            .font(.system(size: 12, weight: .light))
                            .lineLimit(4)
                            .minimumScaleFactor(0.5)
                        
                        
                    }//VSTAck
                    
                    
                    
                }//Hstack
                
            })//NavigationLink
          
        }
        .listStyle(.plain)
       // .navigationTitle("Results of your search")
        
    }
}

struct SearchResultsListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsListView()
    }
}
