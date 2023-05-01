//
//  ContentView.swift
//  emojiPet
//
//  Created by Lexie Zhou on 20/4/2023.
//

import SwiftUI
import AVFoundation
import Firebase
import FirebaseCore

//initialize dog and img, now only consider one dog
var dog_name = "Cookie"
var img = "main_pet"

struct welcomePage: View {
    
    @State private var offset: CGFloat = 0.0
    @State private var isMoveUp: Bool = true
    @State private var audioPlayer: AVAudioPlayer?
    
    
    func startAnimation() {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
                    withAnimation(Animation.easeInOut(duration: 0.5)) {
                        offset = isMoveUp ? -20 : 18 // Set the desired vertical offset
                    }
                    isMoveUp.toggle()
                }
            }
    func startBackgroundMusic(){
        guard let audioURL = Bundle.main.url(forResource: "bgm2", withExtension: "mp3") else {
                    return
                }
                
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
                    audioPlayer?.numberOfLoops = -1 // Set -1 to loop indefinitely
                    audioPlayer?.play()
                } catch {
                    print("Error loading audio file: \(error.localizedDescription)")
                }
            }
    func stopMusic(){
        audioPlayer?.stop()
        audioPlayer = nil
    }
    
    var body: some View {
        NavigationView {
            NavigationLink(destination: loginPageView().navigationBarBackButtonHidden(true)) {
                VStack{
                    Text("Welcome\nto\nEmoji Pet")
                        .font(.custom("Kalam-Bold", size: 40))
                        .padding(.bottom, 50)
                        .padding(.top,50)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                    Text("Tap to Start")
                        .font(.custom("Kalam-Bold", size: 35))
                        .foregroundColor(.gray)
                        .frame(width: 200, height: 50)
                        .cornerRadius(8)
                        .multilineTextAlignment(.center)
                    HStack{
                        Image("main_pet")
                            .resizable()
                            .frame(width: 180, height: 200)
                            .position(x:195,y:200)
                        Image("loveHeart")
                            .resizable()
                            .frame(width:120,height:100)
                            .position(x:100,y:55)
                            .offset(y: offset)
                            .animation(.easeInOut(duration: 1))
                    }
                    .onAppear{
                        startAnimation()
                    }
                }
            }
        }
        .onAppear{
            startBackgroundMusic()
        }
    }
}
    
struct welcomePage_Previews: PreviewProvider {
    static var previews: some View {
        welcomePage()
    }
}

