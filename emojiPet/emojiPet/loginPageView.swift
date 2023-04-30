//
//  loginPageView.swift
//  emojiPet
//
//  Created by 周子涵 on 29/4/2023.
//

import SwiftUI
import AVFoundation
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

struct loginPageView: View {
    @State var email = ""
    @State var password = ""
    @State var successLogin = false
    
    var body: some View {
        if (successLogin) {
            mainPageView().navigationBarBackButtonHidden(true)
        } else {
            content
        }
    }
    
    
    var content: some View {
        NavigationView {
            ZStack{
                VStack{
                    Text("Login")
                        .font(.custom("Kalam-Bold", size: 50))
                        .padding(.bottom, 50)
                        .padding(.top, 10)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                    
                    TextField("Email", text: $email)
                        .foregroundColor(.gray)
                        .textFieldStyle(.plain)
                        .autocapitalization(.none)
//                        .placeholder(when: email.isEmpty){
//                            Text("Email")
//                                .foregroundColor(.gray)
//                                .bold()
//                        }
                    Rectangle()
                        .frame(width: 280, height: 1)
                        .foregroundColor(.gray)
                    
                    SecureField("Password", text: $password)
                        .foregroundColor(.gray)
                        .textFieldStyle(.plain)
                        .autocapitalization(.none)
//                        .placeholder(when: password.isEmpty){
//                            Text("Password")
//                                .foregroundColor(.gray)
//                                .bold()
//                        }
                    Rectangle()
                        .frame(width: 280, height: 1)
                        .foregroundColor(.gray)
                        .padding(.bottom)
                    
                    Button{
                        login()
                    } label: {
                        Text("Go!")
                            .bold()
                            .font(.custom("Kalam-Bold", size: 20))
                            .foregroundColor(.black)
                            .frame(width: 150, height: 40)
                            .background(.gray.opacity(0.4))
                            .cornerRadius(10)
                    }
                    .padding(.top)
                    .offset(y: 80)

                    Image("puppy")
                        .resizable()
                        .frame(width: 180, height: 200)
                        .padding(.top)
                        .offset(x: -120, y: 80)
                }
                .frame(width: 280)
//                .onAppear{
//                    Auth.auth().addStateDidChangeListener{ auth, user in
//                        if user != nil {
//                            successLogin.toggle()
//                        }
//                    }
//                }
            }
            .ignoresSafeArea()
        }
        
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
            } else {
                successLogin = true
                print("success")
            }
        }
    }
}


struct loginPageView_Previews: PreviewProvider {
    static var previews: some View {
        loginPageView()
    }
}
