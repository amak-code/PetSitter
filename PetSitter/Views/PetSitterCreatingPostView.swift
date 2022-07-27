//
//  PetSitterCreatingPostView.swift
//  PetSitter
//
//  Created by antikiller on 12.07.2022.
//

import SwiftUI
import MapKit

struct PetSitterCreatingPostView: View {
    
    @State var showDetailView: Bool = false
    
    @ObservedObject var petSitter: Post
    
    //@ObservedObject  var postViewModel: PostListViewModel
    
    @State var postFirstNameText: String = ""
    @State var postLastNameText: String = ""
    @State var postPrice: String = ""
    @State var postZipCode: String = ""
    @State var postEmail: String = ""
    @State var postPhone: String = ""
    @State var postPicture: String = ""
    @State var postBodyText = "Write something about yourself"
    
    init(petSitter: Post){
        self.petSitter = petSitter
           UITableView.appearance().backgroundColor = .clear
       }
    
    var body: some View {
       
        Form {
            
            general
            
           
            createPostButton
            
            //Spacer()
        }
        .background(.yellow)
        
        
    }
}

struct PetSitterCreatingPostView_Previews: PreviewProvider {
    static var previews: some View {
        PetSitterCreatingPostView(petSitter: Post(nameFirst: "Meggie",nameLast: "Johns", likesCount: 40, phone: "415-333-0000", email: "aaa@gmail.com", picture: "sitter_2", zipcode: "97123", price: 25, textPost: "Hi, My name is Meggie and I like dogs and cats. I can take care of them very well. I'm flexible with the hours and price.", location: Location(latitude: 37.795162, longitude: -122.402728)))
    }
}

private extension PetSitterCreatingPostView {
    
    var general: some View {
        
        Section {
            TextField("Your first Name", text: $postFirstNameText)
                .textContentType(.name)
                .keyboardType(.namePhonePad)
            TextField("Your last Name", text: $postLastNameText)
                .textContentType(.name)
                .keyboardType(.namePhonePad)
            TextField("Price per hour for your service", text: $postPrice)
            TextField("Your zipcode", text: $postZipCode)
            TextField("Your email", text: $postEmail)
            TextField("Your phone", text: $postPhone)
            TextField("Your picture", text: $postPicture)
            postTextEditorField
                      
           
                      } header: {
            Text("Start creating your post")
        } footer: {
            Text("Please fill out all the fields")
        }
      //  .headerProminence(.increased)
//        .onAppear{
//            if let petSitter = petSitter {
//                postFirstNameText = petSitter.nameFirst
//                postLastNameText = petSitter.nameLast
//                postPrice = String(petSitter.price)
//                postPhone = petSitter.phone
//                postEmail = petSitter.email
//                postPicture = petSitter.picture
//                postZipCode = petSitter.zipcode
//                postBodyText = petSitter.textPost
//
//
//
//            }
//        }
        
    }
    
    
    var postTextEditorField: some View {
        
            TextEditor(text: $postBodyText)
            .font(.system(size: 17, weight:.ultraLight,design: .default))
            .foregroundColor(.gray)
            .frame(minHeight: 200, alignment: .leading)
            .multilineTextAlignment(.leading)
        
    }
    
    var createPostButton: some View {
        
        VStack {

            if showDetailView {
                
                if let lastPost = PostListViewModel.shared.posts.last {
                
                PostDetailView(petSitter: lastPost ).transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
                }
          } else {
                
                Button("Create a post"){
                    let group = DispatchGroup()
                    group.enter()
                    
                    DispatchQueue.main.async {
                        prepareForCreatePost(firstName: postFirstNameText, lastName: postLastNameText, price: Int(postPrice) ?? 0, zipCode: postZipCode, email: postEmail, phone: postPhone, picture: postPicture, bodyText: postBodyText)
                        group.leave()
                    }
                   
                    group.notify(queue: .main) {
                            
                        withAnimation {
                            postFirstNameText = ""
                            postLastNameText = ""
                            postPrice = ""
                            postPhone = ""
                            postEmail = ""
                            postPicture = ""
                            postZipCode = ""
                            postBodyText = ""
                           // PostListViewModel.shared.loadFromPersistanceStore()
                            self.showDetailView = true
                           
                            }
                        }
                     
                }
//                {
//                    Text("Create a post")
//                        .font(.system(size: 20, weight: .bold, design: .rounded))
//
//                }//Button
                
           }
            
        }//VStack
        
        
    }
    
    func prepareForCreatePost(firstName: String, lastName: String, price: Int, zipCode: String, email: String, phone: String, picture: String, bodyText: String){
        
       
        
        let postPicture = (picture != "") ? picture : "no_image"
       
        if zipCode != "" {
            getCoordinate(addressString: zipCode) { res in
                DispatchQueue.main.async {
                    switch res {
                    case .success(let coord):
                        let post = Post(nameFirst: firstName, nameLast: lastName,  phone: phone, email: email, picture: postPicture, zipcode: zipCode, price: price, textPost: phone, location: Location(latitude: coord.latitude, longitude: coord.longitude))
                        
                        PostListViewModel.shared.createPost(post: post)
                      
                    case .failure(let error):
                        print("smth bad happened ", error)
                        let post = Post(nameFirst: firstName, nameLast: lastName,  phone: phone, email: email, picture: postPicture, zipcode: zipCode, price: price, textPost: phone, location: Location(latitude: 0, longitude: 0))
                        PostListViewModel.shared.createPost(post: post)
                    }
                }
            }
        }
    }
    
    
    //convering zipCode to the location coordinates
    
    func getCoordinate( addressString : String,
                        completionHandler: @escaping(Result<CLLocationCoordinate2D, Error>) -> Void ) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(addressString) { (placemarks, error) in
            if let error = error {
                return  completionHandler(.failure(error))
            }
            
            if let placemark = placemarks?[0] {
                let location = placemark.location!
                
                completionHandler(.success(location.coordinate))
                return
            } else {
                completionHandler(.failure(NSError()))
            }
        }
    }

    
}
