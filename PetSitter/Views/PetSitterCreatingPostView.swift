//
//  PetSitterCreatingPostView.swift
//  PetSitter
//
//  Created by antikiller on 12.07.2022.
//

import SwiftUI

struct PetSitterCreatingPostView: View {
    
    @State var postFirstNameText: String = ""
    @State var postLastNameText: String = ""
    @State var postPrice: String = ""
    @State var postZipCode: String = ""
    @State var postBodyText = "Write something about yourself"
    
    init(){
           UITableView.appearance().backgroundColor = .clear
       }
    
    var body: some View {
       
        Form {
            
            general
            
           
            createPostButton
            
        }
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
            TextField("Your last Name", text: $postLastNameText)
                .textContentType(.name)
                .keyboardType(.namePhonePad)
            TextField("Price per hour for your service", text: $postPrice)
            TextField("Your zipcode", text: $postZipCode)
            
            postTextEditorField
                      
           
                      } header: {
            Text("Start creating your post")
        } footer: {
            Text("Please fill out all the fields")
        }
        .headerProminence(.increased)
      
        
    }
    
    
    
    var postTextEditorField: some View {
        
        
            
            TextEditor(text: $postBodyText)
//            .font(.custom(
//                   "San Francisco",
//
//                   fixedSize: 17))
            .font(.system(size: 17, weight: .ultraLight,design: .default))
                .foregroundColor(.gray)
                .frame(minHeight: 250, alignment: .leading)
                .multilineTextAlignment(.leading)
        
    }
    
    var createPostButton: some View {
        Button{
            
        }label: {
            HStack {
                    Spacer()
                Text("Create a post")
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                    Spacer()
                  }
        }
    }
    
    
    
}
