//
//  MainPageView.swift
//  PetSitter
//
//  Created by antikiller on 12.07.2022.
//

import SwiftUI

struct MainPageView: View {
    
    //@ObservedObject var postViewModel = PostListViewModel()
   // var petSitter: Post
    
    var body: some View {
       
        NavigationView{
            
            ZStack{
                Image("background_unsplash_main")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
              
                VStack{
                    Text("Welcome to Pet Sitter!")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .padding(-60)
                    
                 
                    
                    VStack{
                        
                        Button(action: {
                         }) {
                             NavigationLink(destination: PetOwnerStartingPageView()) {
                             Text("I'm a pet owner")
                                     .padding(30)
                                     .background(.white)
                                     .font(.system(size: 25, weight: .regular, design: .rounded))
                                     .foregroundColor(.black)
                                     .cornerRadius(12)
                                     .clipShape(Capsule())
                                    
                                     
                             }//.frame(maxHeight: .infinity, alignment: .bottom)
                         }
                        
                        Button(action: {
                         }) {
                             NavigationLink(destination: PetSitterCreatingPostView()) {
                             Text("I'm a pet sitter")
                                     .padding(30)
                                     .background(.white)
                                     .font(.system(size: 25, weight: .regular, design: .rounded))
                                     .foregroundColor(.black)
                                     .cornerRadius(12)
                                     .clipShape(Capsule())
   
                                     
                             }
                         }.frame(maxHeight: .infinity, alignment: .bottom)
                    }.padding()
                    
                    Spacer()
                }//main VStack
//                .navigationTitle("Welcome to Pet Sitter!")
//                .navigationBarTitleDisplayMode(.large)
               //fix the text width
                .padding(.bottom)
                
            }//ZStack
           
            
        }//navigationview
        .onAppear(perform: PostListViewModel.shared.loadFromPersistanceStore)
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}
