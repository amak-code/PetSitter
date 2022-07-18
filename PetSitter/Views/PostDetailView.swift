//
//  PostDetailView.swift
//  PetSitter
//
//  Created by antikiller on 14.07.2022.
//

import SwiftUI
import MapKit

struct PostDetailView: View {
    
    var post: Post
    
   // @ObservedObject var postViewModel = PostListViewModel()

    
    var body: some View {
        
        ZStack {
//          Image("")
//            .resizable()
//            .frame(maxHeight: .infinity)
//            .edgesIgnoringSafeArea(.all)

          VStack {
              if let picture = post.picture {
                  Image(picture)
                          .resizable()
                          .scaledToFit()
                          .frame(width: 260, height: 250, alignment: .leading)
              } else {
                 Image("no_picture")
              }
            VStack(alignment: .leading, spacing: 30) {
                
            Text(post.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
 
              Text("Price: \(post.price) $")
                    .font(.system(size: 20, weight: .bold, design: .default))
                Text("Email: \(post.email)")
                    .font(.system(size: 20, weight: .bold, design: .default))
                Link("Phone number : \( post.phone)", destination: URL(string: "tel://\(post.phone)")!)
               // Text("Phone number : \( post.phone)")
                    .font(.system(size: 20, weight: .bold, design: .default))
            }
            Spacer()
          }
          .padding()
        }
        
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        PostDetailView(post: Post(name: "Meggie", phone: "415-333-0000", email: "aaa@gmail.com", picture: "sitter_2", zipcode: 97123, price: 25, textPost: "Hi, My name is Meggie and I like dogs and cats. I can take care of them very well. I'm flexible with the hours and price.", location: Location(coordinate: CLLocationCoordinate2D(latitude: 37.795162, longitude: -122.402728))))
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
