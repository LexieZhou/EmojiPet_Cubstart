//
//  profilePageView.swift
//  emojiPet
//
//  Created by 周子涵 on 30/4/2023.
//

import SwiftUI

struct profilePageView: View {
    @State private var offset: CGFloat = 0.0
    @State private var isMoveUp: Bool = true
    
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
                            .font(.custom("Kalam-Regular", size: 30))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                    }
                    
                    Rectangle()
                        .frame(width: 350, height: 1)
                        .foregroundColor(.gray)
                    Button{} label: {
                        Text("Owned Pets")
                            .font(.custom("Kalam-Regular", size: 30))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                    }
                    Rectangle()
                        .frame(width: 350, height: 1)
                        .foregroundColor(.gray)
                    HStack {
                        NavigationLink(destination: welcomePage().navigationBarBackButtonHidden(true)){
                            Text("Log Out")
                                .font(.custom("Kalam-Regular", size: 30))
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
                        .padding(.bottom, 70)
                    
                    HStack {
                        Image("pet2")
                            .resizable()
                            .frame(width: 180, height: 180)
                            .offset(x: -90)
                        Image("loveHeart")
                            .resizable()
                            .frame(width:120,height:100)
                            .position(x:-50)
                            .offset(y: offset)
                            .animation(.easeInOut(duration: 1))
                    }.onAppear{
                        startAnimation()
                    }
                }
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

struct profilePageView_Previews: PreviewProvider {
    static var previews: some View {
        profilePageView()
    }
}
