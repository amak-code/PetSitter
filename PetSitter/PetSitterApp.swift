//
//  PetSitterApp.swift
//  PetSitter
//
//  Created by antikiller on 12.07.2022.
//

import SwiftUI
import FirebaseCore
import FirebaseDatabase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    Database.database().isPersistenceEnabled = true
      
    return true
  }
}

@main
struct PetSitterApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            MainPageView()
        }
    }
}
