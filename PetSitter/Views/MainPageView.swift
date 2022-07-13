//
//  MainPageView.swift
//  PetSitter
//
//  Created by antikiller on 12.07.2022.
//

import SwiftUI

struct MainPageView: View {
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
                    
                    Spacer()
                    
                    VStack{
                        Button(action: {
                         }) {
                             NavigationLink(destination: PetOwnerStartingPageView()) {
                             Text("I'm a pet owner")
                                     .padding()
                                     .background(.white)
                                     .font(.system(size: 20, weight: .regular, design: .rounded))
                                     .foregroundColor(.black)
                                     .cornerRadius(12)
                                     .clipShape(Capsule())
                                    
                                     
                             }
                         }
                        
                        Button(action: {
                         }) {
                             NavigationLink(destination: PetSitterCreatingPostView()) {
                             Text("I'm a pet sitter")
                                     .padding()
                                     .background(.white)
                                     .font(.system(size: 20, weight: .regular, design: .rounded))
                                     .foregroundColor(.black)
                                     .cornerRadius(12)
                                     .clipShape(Capsule())
                                    
                                     
                                     
                             }
                         }.frame(maxHeight: .infinity, alignment: .top)
                    }.padding()
                    
                    Spacer()
                }//main VStack
//                .navigationTitle("Welcome to Pet Sitter!")
//                .navigationBarTitleDisplayMode(.large)
               //fix the text width
                .padding(.bottom)
                
            }//ZStack
           
            
        }//navigationview
        
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}
