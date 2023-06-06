//
//  ContentView.swift
//  firebase-APP
//
//  Created by user on 05/06/2023.
//

import SwiftUI
import FirebaseCore
//import FirebaseFirestore
import FirebaseAuth
import Foundation

struct ContentView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var address = ""
    
    var body: some View {
        
        ZStack{
            
            Color.black
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [.pink, .red], startPoint:
                        .topLeading, endPoint: .bottomTrailing))
                .frame (width: 1000, height: 400)
                .rotationEffect(.degrees (135))
                .offset(y: -350)
            
            VStack(spacing:20){
                Text("welcome")
                    .foregroundColor(.white)
                    .font (.system(size: 40, weight: .bold, design: .rounded))
                    .offset(x: -100,y: -100)
                
                TextField("Email", text:$email)
                    .foregroundColor(.white)
                    .bold()
                
                Rectangle()
                    .frame (width: 350, height: 1)
                    .foregroundColor (.white)
                
                TextField("address", text:$address)
                    .foregroundColor(.white)
                    .bold()
                
//                let address = UlTextField()
//                address.textContentType = .fullStreetAddress
//
//                static let username: UITextContentType
//
                Rectangle()
                    .frame (width: 350, height: 1)
                    .foregroundColor (.white)
                
                SecureField(password, text: $password)
                    .foregroundColor (.white)
                    .textFieldStyle (.plain)
                //                .placeholder(when: password.isEmpty) {
                //                    Text("Password")
                //                        .foregroundColor (.white)
                //                        .bold ()
                //                }
                
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                
                Button {
                    login()
                } label: {
                    Text ("Sign up")
                        .frame (width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.linearGradient(colors: [.pink, .red],startPoint: .top , endPoint: .bottomTrailing))
                        )
                        .foregroundColor(.white)
                        .padding (.top)
                        .offset(y: 100)
                }
                    
                    
                    
                    Button{
                        register()
                    }
                label:{
                    Text ("Already have an account? Login")
                        .bold()
                        .foregroundColor (.white)
                }
                .padding (.top)
                .offset(y: 110)
                }
                .frame (width: 350)
            }
        
        .ignoresSafeArea()
        
    }
}
    
    func register() {
        Auth.auth().createUser(withEmail: "email", password: "password") { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: "email", password: "password") { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
