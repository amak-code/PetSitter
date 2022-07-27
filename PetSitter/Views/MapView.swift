//
//  MapView.swift
//  PetSitter
//
//  Created by antikiller on 13.07.2022.
//

import SwiftUI
import CoreLocation
import MapKit


struct MapView: View {
    
    @StateObject private var viewModel = MapViewModel()
    @State var userTrackingMode: MapUserTrackingMode = .follow
    @State var zoom: CGFloat = 30
 
//    var locations: [Location] {
//
//      var first =  Location(name: "First sitter", coordinate: CLLocationCoordinate2D(latitude: 37.795162, longitude: -122.402728), post: Post(name: "Meggie", phone: "415-333-0000", email: "aaa@gmail.com", picture: "sitter_1", zipcode: 97123, price: 25, textPost: "Hi, My name is Meggie and I like dogs and cats. I can take care of them very well. I'm flexible with the hours and price."));
//      var second = Location(name: "Second sitter", coordinate: CLLocationCoordinate2D(latitude: 37.7897, longitude: -122.3972), post: Post(name: "John", phone: "415-333-0000", email: "aaa@gmail.com", picture: "sitter_1", zipcode: 97123, price: 25, textPost: "Hi, My name is Meggie and I like dogs and cats. I can take care of them very well. I'm flexible with the hours and price."))
//
//        return [first, second]
//    }
//
    var body: some View {
        
        VStack{
            
            Map(coordinateRegion: $viewModel.mapRegion,
                interactionModes: .all,
                showsUserLocation: true, userTrackingMode: $userTrackingMode, annotationItems: PostListViewModel.shared.posts
            ){petsitter in
                MapAnnotation(coordinate: petsitter.location.coordinate) {
                    NavigationLink {
                       //MARK: -   will it work that way or should I make constant???
                        PostDetailView(petSitter: petsitter)
                        //Text(petsitter.name ?? "")
                    } label: {
                        Circle()
                            .stroke(.red, lineWidth: 3)
                            .frame(width: 34, height: 34)
                    }
                }
                
                
            }
            .ignoresSafeArea()
            .onAppear{
                viewModel.checkLocationServicesIsEnabled()
            }
            
            Slider(value: $zoom,
                         in: 0.01...1,
                         minimumValueLabel: Image(systemName: "plus.circle"),
                         maximumValueLabel: Image(systemName: "minus.circle"), label: {})
                    .padding(.horizontal)
                    .onChange(of: zoom) { value in
                        viewModel.mapRegion.span.latitudeDelta = CLLocationDegrees(value)
                        viewModel.mapRegion.span.longitudeDelta = CLLocationDegrees(value)
                    }
               
            
        }//Vstack
        .font(.title)
    }
    
    
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager?
    
    @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37, longitude: -122), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta:0.5))
    
    func checkLocationServicesIsEnabled(){
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager = CLLocationManager()
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            locationManager?.delegate = self
        }
        else {
            print("ALert")
        }
        
    }
    
   private func checkLoactionAuthorization(){
        
        guard let locationManager = locationManager else {return}
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Parental control")
        case .denied:
            print("You have denied this app location permission.")
        case .authorizedAlways, .authorizedWhenInUse:
            mapRegion = MKCoordinateRegion(center: locationManager.location?.coordinate ?? CLLocationCoordinate2D(latitude: 37, longitude: -122), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta:0.5))
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLoactionAuthorization()
    }
    
}
