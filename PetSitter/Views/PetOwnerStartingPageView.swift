//
//  PetOwnerStartingPageView.swift
//  PetSitter
//
//  Created by antikiller on 12.07.2022.
//

import SwiftUI

struct PetOwnerStartingPageView: View {
    var body: some View {
            
            VStack(alignment: .center, spacing: 8){
                    
                    Text("Find a pet sitter for your loved ones!")
                        
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .multilineTextAlignment(.center)
                        //.padding()
                    
                Spacer()
                    Image("cat_lap")
                        .resizable()
                        .cornerRadius(12)
                        .frame(width: UIScreen.main.bounds.width - 100, height: UIScreen.main.bounds.height - 600)
                        //.padding(90)
                       // .scaledToFill()
                       // .edgesIgnoringSafeArea(.all)
                    
               Spacer()
                    
                    VStack{
                        Button(action: {
                         }) {
                             NavigationLink(destination: MapView()) {
                             Text("Show sitters around me")
                                     .padding(30)
                                     .background(.gray)
                                     .font(.system(size: 25, weight: .regular, design: .rounded))
                                     .foregroundColor(.black)
                                     .cornerRadius(12)
                                     .clipShape(Capsule())
                                    
                                     
                             }
                         }
                        
                        Button(action: {
                         }) {
                             NavigationLink(destination: SearchView()) {
                             Text("I want to do a search")
                                     .padding(30)
                                     .background(.gray)
                                     .font(.system(size: 25, weight: .regular, design: .rounded))
                                     .foregroundColor(.black)
                                     .cornerRadius(12)
                                     .clipShape(Capsule())
                                    
                                     
                                     
                             }
                         }
                    }
                    
                }//main VStack
//                .navigationTitle("Welcome to Pet Sitter!")
  
        
    }
}

struct PetOwnerStartingPageView_Previews: PreviewProvider {
    static var previews: some View {
        PetOwnerStartingPageView()
    }
}
