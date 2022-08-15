//
//  PetSitterCreatingPostView.swift
//  PetSitter
//
//  Created by antikiller on 12.07.2022.
//

import SwiftUI
import MapKit

struct PetSitterCreatingPostView: View {
    
    
    //vars for setting up the imagepicker
    // @State var changeProfileImage = false
    @State var openCameraRoll = false
    @State var imageSelected = UIImage()
    @State var showAlert: Bool = false
    @State var petSitter: Post?
    
    //@ObservedObject  var postViewModel: PostListViewModel
    
    @State var showDetailView: Bool = false
    @State var postFirstNameText: String = ""
    @State var postLastNameText: String = ""
    @State var postPrice: String = ""
    @State var postZipCode: String = ""
    @State var postEmail: String = ""
    @State var postPhone: String = ""
    // @State var postPicture: String = ""
    @State var postBodyText = "Write something about yourself"
    
    init(){
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        
        Form {
            
            general
            
            
            createPostButton
            
            //Spacer()
        }
        .alert(Text("Important message"), isPresented: $showAlert, actions: {
            Button("OK", role: .cancel, action: {})
        }, message: {
            Text("Thank you for creating a post. It will expire in 30 days.")
        })
        .background(.yellow)
        
        
    }
}

struct PetSitterCreatingPostView_Previews: PreviewProvider {
    static var previews: some View {
        PetSitterCreatingPostView()
    }
}

private extension PetSitterCreatingPostView {
    
    var general: some View {
        
        Section {
            TextField("Your first Name", text: $postFirstNameText)
                .textContentType(.name)
                .keyboardType(.namePhonePad)
                .disableAutocorrection(true)
            TextField("Your last Name", text: $postLastNameText)
                .textContentType(.name)
                .keyboardType(.namePhonePad)
                .disableAutocorrection(true)
            TextField("Price per hour for your service", text: $postPrice)
                .keyboardType(.decimalPad)
            TextField("Your zipcode", text: $postZipCode)
                .keyboardType(.decimalPad)
            
            TextField("Your email", text: $postEmail)
                .disableAutocorrection(true)
                .autocapitalization(.none)
            
            TextField("Your phone", text: $postPhone)
                .keyboardType(.decimalPad)
            
            ZStack(alignment: .trailing) {
                
                TextField("Your picture", text: (.constant("")))
                
                Button(action: {
                    
                    openCameraRoll = true
                }) {
                    Image(systemName: "plus.app")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 30, height: 30)
                        .padding(.trailing, 10)
                }.sheet(isPresented: $openCameraRoll){
                    ImagePicker(selectedImage: $imageSelected, sourceType: .photoLibrary)
                }
                
            }
            
            postTextEditorField
            
        } header: {
            Text("Start creating your post")
        } footer: {
            Text("Please fill out all the fields.")
        }

        
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
             
                //PostListViewModel.shared.loadFromPersistanceStore()
                if let lastPost = petSitter {
                   
                    PostDetailView(petSitter: lastPost ).transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
                    
                }
            } else {
                
                Button("Create a post"){
                    let group = DispatchGroup()
                    group.enter()
                    
                    DispatchQueue.main.async {
                        hideKeyboard()
                        prepareForCreatePost(firstName: postFirstNameText, lastName: postLastNameText, price: Int(postPrice) ?? 0, zipCode: postZipCode, email: postEmail, phone: postPhone, picture: imageSelected.toJpegString(compressionQuality: 0.5) ?? "no_image", bodyText: postBodyText)
                        
                        group.leave()
                    }
                    
                    group.notify(queue: .main) {
                        
                        withAnimation {
                            
                            postFirstNameText = ""
                            postLastNameText = ""
                            postPrice = ""
                            postPhone = ""
                            postEmail = ""
                            //  postPicture = ""
                            postZipCode = ""
                            postBodyText = ""
                            
                           
                            self.showDetailView = true
                           
                            self.showAlert = true
                            
                        }
                    }
                  
                    
                }
             
                
            }
            
        }//VStack
        
       
        
        
    }
    
    func prepareForCreatePost(firstName: String, lastName: String, price: Int, zipCode: String, email: String, phone: String, picture: String, bodyText: String){
        
        
        
        //let postPicture = (picture != "") ? picture : "no_image"
        
        if zipCode != "" {
            getCoordinate(addressString: zipCode) { res in
                DispatchQueue.main.async {
                    switch res {
                    case .success(let coord):
                        let post = Post(nameFirst: firstName, nameLast: lastName,  phone: phone, email: email, picture: picture, zipcode: zipCode, price: price, textPost: phone, location: Location(latitude: coord.latitude, longitude: coord.longitude))
                        
                        PostListViewModel.shared.createPost(post: post)
                        petSitter = post
                       
                        
                    case .failure(let error):
                        print("smth bad happened ", error)
                        let post = Post(nameFirst: firstName, nameLast: lastName,  phone: phone, email: email, picture: picture, zipcode: zipCode, price: price, textPost: phone, location: Location(latitude: 0, longitude: 0))
                        PostListViewModel.shared.createPost(post: post)
                        petSitter = post
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

extension UIImage {
    func toJpegString(compressionQuality cq: CGFloat) -> String? {
        let data = self.jpegData(compressionQuality: cq)
        return data?.base64EncodedString(options: .endLineWithLineFeed)
    }
}

extension String {
    func toImage() -> UIImage {
        let noPicture = UIImage(named: "no_image")!
        
        if let data = Data(base64Encoded: self, options: .ignoreUnknownCharacters){
            return UIImage(data: data) ?? noPicture
        }
        return noPicture
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
