//
//  SearchView.swift
//  PetSitter
//
//  Created by antikiller on 13.07.2022.
//

import SwiftUI

struct SearchView: View {
    
    @State private var isShowingSearchResultView = false
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var pricePerHour: String = ""
    @State var zipCode: String = ""
    
    
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
            TextField("First Name", text: $firstName)
                .textContentType(.name)
                .keyboardType(.namePhonePad)
            TextField("Last Name", text: $lastName)
                .textContentType(.name)
                .keyboardType(.namePhonePad)
            TextField("Price per hour up to ", text: $pricePerHour)
            TextField("ZipCode", text: $zipCode)
            
            
        } header: {
            Text("Start your search")
        } footer: {
            Text("Please enter any information about the pet sitter")
        }
        .headerProminence(.increased)

    }
    
    
    var searchButton: some View {
        
      
            ZStack {
            
                    Button("Search"){
                        self.isShowingSearchResultView = true
//                        .font(.system(size: 20, weight: .bold, design: .rounded))
//                        .padding(10)
//                        .background(.white)
//                        .foregroundColor(.blue)
//                        .cornerRadius(12)
                    }
                                   
                NavigationLink(destination: SearchResultsListView(firstName: $firstName, lastName: $lastName, pricePerHour: $pricePerHour, zipCode: $zipCode, posts: PostListViewModel.shared.posts), isActive: $isShowingSearchResultView){EmptyView()}.buttonStyle(.plain)
            
            }.padding()
        
    }
    
}
