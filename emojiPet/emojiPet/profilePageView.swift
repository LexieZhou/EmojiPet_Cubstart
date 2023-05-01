//
//  profilePageView.swift
//  emojiPet
//
//  Created by 周子涵 on 30/4/2023.
//

import SwiftUI

struct profilePageView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    HStack {
                        Image("avatar")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .padding(.top)
                        Text("Jenny")
                            .font(.custom("Kalam-Bold", size: 50))
                            .padding(.bottom, 50)
                            .padding(.top, 10)
                            .offset(y: 20)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                    }
                    .padding(.bottom, 60)
                    
                    Rectangle()
                        .frame(width: 350, height: 1)
                        .foregroundColor(.gray)
                    Button{} label: {
                        Text("Profile Setting")
                            .font(.custom("Kalam-Bold", size: 30))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                    }
                    
                    Rectangle()
                        .frame(width: 350, height: 1)
                        .foregroundColor(.gray)
                    Button{} label: {
                        Text("Owned Pets")
                            .font(.custom("Kalam-Bold", size: 30))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                    }
                    Rectangle()
                        .frame(width: 350, height: 1)
                        .foregroundColor(.gray)
                    HStack {
                        NavigationLink(destination: welcomePage().navigationBarBackButtonHidden(true)){
                            Text("Log Out")
                                .font(.custom("Kalam-Bold", size: 30))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                            Image("back")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                    }
                    Rectangle()
                        .frame(width: 350, height: 1)
                        .foregroundColor(.gray)
                    
                }.padding(.bottom, 140)
            }
        }
    }
}

struct profilePageView_Previews: PreviewProvider {
    static var previews: some View {
        profilePageView()
    }
}
