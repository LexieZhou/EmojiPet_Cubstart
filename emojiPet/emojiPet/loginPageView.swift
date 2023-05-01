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
    @State private var offset: CGFloat = 0.0
    @State private var isMoveUp: Bool = true
    @State private var showingUnsuccessAlert = false
    
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

                    Rectangle()
                        .frame(width: 280, height: 1)
                        .foregroundColor(.gray)
                    
                    SecureField("Password", text: $password)
                        .foregroundColor(.gray)
                        .textFieldStyle(.plain)
                        .autocapitalization(.none)

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
                    .alert("Unsuccessful Login", isPresented: $showingUnsuccessAlert) {
                        Button("OK", role: .cancel) { }
                    }
                    .padding(.top)
                    .offset(y: 80)
                    
                    NavigationLink(destination: registerPageView()){
                        Text("No account? Register One!")
                            .bold()
                            .font(.custom("Kalam-Bold", size: 20))
                            .foregroundColor(.black)
                            .underline()
                    }
                    .padding(.top)
                    .offset(y: 85)
                    .frame(width: 350)
                    
                    HStack {
                        Image("puppy")
                            .resizable()
                            .frame(width: 180, height: 200)
                            .padding(.top)
                            .offset(x: -50, y: 80)
                        
                        Image("stars")
                            .resizable()
                            .frame(width:100,height:100)
                            .offset(x: -82, y: offset)
                            .animation(.easeInOut(duration: 1))
                    }
                    .offset(y: 20)
                    .onAppear{
                        startAnimation()
                    }
                }
                .frame(width: 280)
            }
            .ignoresSafeArea()
        }
        
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
                showingUnsuccessAlert = true
            } else {
                successLogin = true
                print("success")
            }
        }
    }
    
    func startAnimation() {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
                    withAnimation(Animation.easeInOut(duration: 0.5)) {
                        offset = isMoveUp ? -20 : 18 // Set the desired vertical offset
                    }
                    isMoveUp.toggle()
                }
            }
}


struct loginPageView_Previews: PreviewProvider {
    static var previews: some View {
        loginPageView()
    }
}
