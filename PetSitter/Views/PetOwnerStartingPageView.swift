//
//  PetOwnerStartingPageView.swift
//  PetSitter
//
//  Created by antikiller on 12.07.2022.
//

import SwiftUI

struct PetOwnerStartingPageView: View {
    var body: some View {
            
        
        ZStack {
            
            Image("cat_lap")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 10){
                
                Text("Find a pet sitter for your loved ones!")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 2)
                    // .background(.gray)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .frame(width: 400, height: 400)
                    .padding(.top, 10)
                    //.padding(.bottom, 70)
                    .offset(y: -140)
                    
                
                Spacer()


                VStack{
                    Button(action: {
                    }) {
                        NavigationLink(destination: MapView()) {
                            Text("Show sitters around me")
                                .padding(5)
                                .background(.yellow)
                                .font(.system(size: 34, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                                .cornerRadius(12)
                                .clipShape(Capsule())
                            
                            
                        }
                    }
                    .padding()
                    

                    Button(action: {
                    }) {
                        NavigationLink(destination: SearchView()) {
                            Text("I want to do a search")
                                .padding(10)
                                .padding(.leading, 10)
                                .padding(.trailing, 10)
                                .background(.yellow)
                                .font(.system(size: 35, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                                .cornerRadius(12)
                                .clipShape(Capsule())
                            
                            
                            
                        }
                    }
                }
                
            }//main VStack
            //                .navigationTitle("Welcome to Pet Sitter!")
        
        }//Zstack
        
  
        
    }
}

struct PetOwnerStartingPageView_Previews: PreviewProvider {
    static var previews: some View {
        PetOwnerStartingPageView()
    }
}
