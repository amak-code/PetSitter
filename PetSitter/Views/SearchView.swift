//
//  SearchView.swift
//  PetSitter
//
//  Created by antikiller on 13.07.2022.
//

import SwiftUI

struct SearchView: View {
    
    init(){
           UITableView.appearance().backgroundColor = .clear
       }
    
    var body: some View {
       
        
        VStack{
            Form{

                general
                
                searchButton
                
            }//Form
          
            
                
        }
        .background(.yellow)
        
        
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

private extension SearchView {
    
    var general: some View {
        
        Section {
            TextField("First Name", text: .constant(""))
                .textContentType(.name)
                .keyboardType(.namePhonePad)
            TextField("Last Name", text: .constant(""))
                .textContentType(.name)
                .keyboardType(.namePhonePad)
            TextField("Price per hour", text: .constant(""))
            TextField("ZipCode", text: .constant(""))
            
            
        } header: {
            Text("Start your search")
        } footer: {
            Text("Please enter any information about the pet sitter")
        }
        .headerProminence(.increased)
      
        
    }
    
    
    var searchButton: some View {
//        Button{
//            NavigationLink(LocalizedStringKey, destination: SearchResultsListView(posts: PostListViewModel.shared.posts))
//        }label: {
//            HStack {
//                    Spacer()
//                Text("Search")
//                    .font(.system(size: 25, weight: .bold, design: .rounded))
//                    Spacer()
//                  }
//        }
        Button(action: {
        }) {
            NavigationLink(destination: SearchResultsListView(posts: PostListViewModel.shared.posts)) {
                Text("Search")
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                    .padding(10)
                    .background(.white)
                    .foregroundColor(.blue)
                    .cornerRadius(12)
                    Spacer()


            }
        }
        .padding()
        
    }
    
}
