//
//  registerPageView.swift
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

//register page view
struct registerPageView: View {
    @State var email = ""
    @State var password = ""
    @State var successRegister = false
    @State private var showUnsucessAlert = false
    @State private var showSucessAlert = false


    func register(){
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
            }
        }
    }

    var body: some View {
        NavigationView {
            ZStack{
                VStack{
                    Text("Sign up")
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
                        register()
                    } label: {
                        Text("Sign up")
                            .bold()
                            .font(.custom("Kalam-Bold", size: 20))
                            .foregroundColor(.black)
                            .frame(width: 150, height: 40)
                            .background(.gray.opacity(0.4))
                            .cornerRadius(10)
                    }
                    .padding(.top)
                    .offset(y: 80)
//                    .onSubmit {
//                        if (!successRegister) {
//                            showUnsucessAlert = true
//                        } else {
//                            showSucessAlert = true
//                        }
//                    }.alert("Unsucessful Register", isPresented: $showUnsucessAlert){
//                        Button("Okay", role: .cancel){}
//                    } message: {
//                        Text("Unsucessful Register.")
//                    }.alert("Register Successfully! Please go login!", isPresented: $showSucessAlert){
//                        Button("Okay", role: .cancel){}
//                    } message: {
//                        Text("Register Successfully! Please go login!")
//                    }
                    
                    NavigationLink(destination: loginPageView()){
                        Text("Already have an account? Login")
                            .bold()
                            .font(.custom("Kalam-Bold", size: 20))
                            .foregroundColor(.black)
                            .underline()
                    }
                    .padding(.top)
                    .offset(y: 85)
                    .frame(width: 350)
                    
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
//                            successRegister.toggle()
//                        }
//                    }
//                }
            }
            .ignoresSafeArea()
        }
        
    }
        
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

struct registerPageView_Previews: PreviewProvider {
    static var previews: some View {
        registerPageView()
    }
}
