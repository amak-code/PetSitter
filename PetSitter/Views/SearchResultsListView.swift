//
//  SearchResultsListView.swift
//  PetSitter
//
//  Created by antikiller on 19.07.2022.
//

import SwiftUI
import MapKit

struct SearchResultsListView: View {
    
    init(){
           UITableView.appearance().backgroundColor = .clear
       }
    var posts:[Post] = PetSitterController.shared.petsitters
    
    var body: some View {
        
        List(posts, id: \.id) {petSitter in
            
            HStack{
                Image(petSitter.picture ?? "figure.walk")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 90)
                    .cornerRadius(4)
                    .padding(3)
                    .background(.yellow)
                
                VStack(alignment: .leading, spacing: 3){
                    
                    HStack {
                        
                        Text("FirstName")
                        
                            .font(.system(size: 17, weight: .semibold))
                        Text("Last Name")
                            .font(.system(size: 17, weight: .semibold))
                    }
                    Text("Price25$")
                        .font(.subheadline)
                        .font(.system(size: 15, weight: .semibold))
                    Text("Body text: a bit about myself Body text: a bit about myself Body text: a bit about myself Body text: a bit about myself Body text: a bit about myself Body text: a bit about myself Body text: a bit about myself ")
                        .font(.system(size: 12, weight: .light))
                        .lineLimit(4)
                        .minimumScaleFactor(0.5)
                    
                    
                }//VSTAck
                
                
                
            }//Hstack
          
        }
        .listStyle(.plain)
        .navigationTitle("Results of your search")
        
    }
}

struct SearchResultsListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsListView()
    }
}
