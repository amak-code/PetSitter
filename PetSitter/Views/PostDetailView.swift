//
//  PostDetailView.swift
//  PetSitter
//
//  Created by antikiller on 14.07.2022.
//

import SwiftUI
import MapKit

struct PostDetailView: View {
    
   var petSitter: Post
    
    var body: some View {
        
        ZStack {
//          Image("")
//            .resizable()
//            .frame(maxHeight: .infinity)
//            .edgesIgnoringSafeArea(.all)

          VStack {
            
              Image(uiImage: petSitter.picture.toImage())
                          .resizable()
                          .scaledToFit()
                          .cornerRadius(12)
                          .frame(height: 250, alignment: .leading)
                          //.padding()
           
            VStack(alignment: .leading, spacing: 30) {
            
                HStack {
                    
                    
                    Text(petSitter.nameFirst)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text(petSitter.nameLast)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.trailing)
                    HStack {
                        
                        Button(action:{PostListViewModel.shared.likePost(post: petSitter)
                           
                        } )
                        {
                            Image(systemName: "heart")
                            
                        }
                        Text("\(petSitter.likesCount)")
                        
                    }
                }
              Text("Price for pet sitting per hour: \(petSitter.price) $")
                    .font(.system(size:17, weight: .bold, design: .default))
                Text("About myself: \(petSitter.textPost)")
                    .minimumScaleFactor(0.5)
                  //  .multilineTextAlignment(.center)
                
                Text("Email: \(petSitter.email)")
                    .font(.system(size:17, weight: .regular, design: .default))
                Link("Phone number : \( petSitter.phone)", destination: URL(string: "tel://\(petSitter.phone)")!)
                    .font(.system(size: 17, weight: .regular, design: .default))
//                if let url = URL(string: "tel://\(post.phone)"){
//                    UIApplication.shared.open(url)
//                }
               // Text("Phone number : \( post.phone)")
               
                  
            }
            Spacer()
          }
          .padding()
        }
        
    }
}


//extension PostDetailView {
//    func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
//        modifier(HiddenModifier(isHidden: hidden, remove: remove))
//    }
//}
//private struct HiddenModifier: ViewModifier {
//    private let isHidden: Bool
//    private let remove: Bool
//    init(isHidden: Bool, remove: Bool = false) {
//        self.isHidden = isHidden
//        self.remove = remove
//    }
//    func body(content: Content) -> some View {
//        Group {
//            if isHidden {
//                if remove {
//                    EmptyView()
//                } else {
//                    content.hidden()
//                }
//            } else {
//                content
//            }
//        }
//    }
//}
