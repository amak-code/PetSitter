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
    
   //@ObservedObject var postViewModel = PostListViewModel()

    
    var body: some View {
        
        ZStack {
//          Image("")
//            .resizable()
//            .frame(maxHeight: .infinity)
//            .edgesIgnoringSafeArea(.all)

          VStack {
              if let picture = petSitter.picture {
                  Image(picture)
                          .resizable()
                          .scaledToFit()
                          .cornerRadius(12)
                          .frame(height: 250, alignment: .leading)
                          //.padding()
              } else {
                 Image("no_picture")
              }
            VStack(alignment: .leading, spacing: 30) {
            
                HStack {
                    
                    Text(petSitter.nameFirst)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text(petSitter.nameLast)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.trailing)
                    
                    Label("\(petSitter.likesCount)", systemImage: "heart")
                }
              Text("Price for pet sitting per hour: \(petSitter.price) $")
                    .font(.system(size:17, weight: .bold, design: .default))
                Text("About myself: \(petSitter.textPost)")
                  //  .multilineTextAlignment(.center)
                
                Text("Email: \(petSitter.email)")
                    .font(.system(size:20, weight: .regular, design: .default))
                Link("Phone number : \( petSitter.phone)", destination: URL(string: "tel://\(petSitter.phone)")!)
                    .font(.system(size: 20, weight: .regular, design: .default))
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

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
//        PostDetailView(petSitter: Post(nameFirst: "Meggie", nameLast: "Johns", phone: "415-333-0000", email: "aaa@gmail.com", picture: "sitter_2", zipcode: 97123, price: 25, textPost: "Hi, My name is Meggie and I like dogs and cats. I can take care of them very well. I'm flexible with the hours and price.", location: Location(coordinate: CLLocationCoordinate2D(latitude: 37.795162, longitude: -122.402728))))
        PostDetailView(petSitter: PetSitterController.shared.petsitters.first!)
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
