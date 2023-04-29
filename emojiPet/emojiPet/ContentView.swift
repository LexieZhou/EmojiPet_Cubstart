//
//  ContentView.swift
//  emojiPet
//
//  Created by Lexie Zhou on 20/4/2023.
//

import SwiftUI
import AVFoundation

var img10 = "10%"
var img30 = "30%"
var img50 = "50%"
var img70 = "70%"
var img100 = "100%"

//initialize dog and relative bar img, now only consider one dog
var dog_name = "Cookie"
var hunger_bar = img10
var energy_bar = img30
var happiness_bar = img70
var img = "main_pet"

// values
var progress_bar_height_main = 35.0
var hunger_color = Color.brown.opacity(0.7)
var thirst_color = Color.blue.opacity(0.5)
var energy_color = Color.green.opacity(0.7)
var happiness_color = Color.red.opacity(0.6)

//store custom color
struct CustomColor {
    static let btnColor = Color("btnColor")
}

//progress bar
struct HorizontalProgressBar: View {
    
    @Binding var progress: Double // Progress value between 0 and 1
    var barColor: Color
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(Color.gray.opacity(0.5))
                    .frame(width: geometry.size.width, height: 30)
                    .cornerRadius(10)
                Rectangle()
                    .foregroundColor(barColor)
                    .frame(width: min(geometry.size.width * self.progress, geometry.size.width), height: 30)
                    .cornerRadius(10)
                    .animation(.linear(duration: 0.5))
            }
            
        }
    }
        
}


// text and progress bar
struct TextAndBar: View {
    
    var description: String
    
    @Binding var progress: Double // Progress value between 0 and 1
    var barColor: Color
    
    var body: some View {
        Text(description)
            .font(.custom("Kalam-Regular", size: 20))
            .frame(maxWidth: .infinity, alignment: .leading)
        HorizontalProgressBar(progress: $progress, barColor: barColor)
    }
}

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
            NavigationLink(destination: ContentView()) {
                VStack{
                    Text("Welcome\nto\nEmoji Pet")
                        .font(.custom("Kalam-Bold", size: 50))
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

//main page view
struct ContentView: View {
    //showing sheet when button is clicked
    @State private var showingSheet = false
    
    @State var hunger = 0.3
    @State var thirst = 0.3
    @State var energy = 0.5
    @State var happiness = 0.7
    
    
    
    var body: some View {
        VStack(spacing: 5) {
            Text(dog_name)
                .padding()
                .font(.custom("Kalam-Bold", size: 34))
            
            TextAndBar(description: "Hunger", progress: $hunger, barColor: hunger_color)
                .frame(height: progress_bar_height_main)
                
            TextAndBar(description: "Thirst", progress: $thirst, barColor: thirst_color)
                .frame(height: progress_bar_height_main)
            
            TextAndBar(description: "Energy", progress: $energy, barColor: energy_color)
                .frame(height: progress_bar_height_main)
            
            TextAndBar(description: "Happiness", progress: $happiness, barColor: happiness_color)
                .frame(height: progress_bar_height_main)
            
            Spacer()
            
            Button{
                showingSheet.toggle()
            } label: {
                Text("Take Care of it")
                    .font(.custom("Kalam-Bold", size: 20))
                    .foregroundColor(.black)
                    .frame(width: 160, height: 50)
                    .background(CustomColor.btnColor)
                    .cornerRadius(8)
            }
                .padding()
                .sheet(isPresented: $showingSheet) {
                                    Sheet(hunger: $hunger, thirst: $thirst, energy: $energy, happiness: $happiness)
                }
            Image("main_pet")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .padding()
    }
}

//showing sheet page
struct Sheet: View {
    //call the dismiss function which closes the sheet view
    @Environment(\.dismiss) var dismiss
    @State private var food = false
    @State private var water = false
    @State private var bath  = false
    @State private var walk = false
    @State private var nail = false
    
    @Binding var hunger : Double
    @Binding var thirst : Double
    @Binding var energy : Double
    @Binding var happiness : Double
    
    var body: some View {
        
        ZStack{
            VStack(
                alignment: .center
            ){
                HStack {
                    VStack(spacing: 2) {
                        Button{
                            dismiss();
                            food = false
                            water = false
                        } label: {
                            Text("Back")
                                .frame(width: 40, height: 40)
                                .font(.custom("Kalam-Bold", size: 16))
                                .foregroundColor(.black)
                                .background(CustomColor.btnColor)
                                .clipShape(Circle())
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        TextAndBar(description: "Hunger", progress: $hunger, barColor: hunger_color)

                        TextAndBar(description: "Thirst", progress: $thirst, barColor: thirst_color)

                        TextAndBar(description: "Energy", progress: $energy, barColor: energy_color)

                        TextAndBar(description: "Happiness", progress: $happiness, barColor: happiness_color)
                        
                    }.padding()//Vstack
                    Image(img)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }.padding()//Hstack
                
                Form {
                    Button("Feed the dog food"){
                        food = true
                        water = false
                        bath = false
                        walk = false
                        nail = false
                        
                        hunger = min(1, hunger + 0.2)
                        happiness = min(1, happiness + 0.1)
                    }.padding()
                        .foregroundColor(.black)
                        .fontDesign(.serif)//.sheet(isPresented: $sheet1){
                    //Sheet()}
                    
                    Button("Feed the dog water"){
                        water = true
                        food = false
                        bath = false
                        walk = false
                        nail = false
                        
                        thirst = min(1, thirst + 0.2)
                    }
                    .padding()
                    .foregroundColor(.black)
                    .fontDesign(.serif)
                    Button("Bath the dog"){
                        bath = true
                        water = false
                        food = false
                        walk = false
                        nail = false
                        
                        energy = min(1, energy + 0.1)
                        happiness = min(1, happiness + 0.1)
                    }
                    .padding()
                    .foregroundColor(.black)
                    .fontDesign(.serif)
                    Button("Walk the dog"){
                        walk = true
                        bath = false
                        water = false
                        food = false
                        nail = false
                        
                        hunger = max(0, hunger - 0.2)
                        thirst = max(0, thirst - 0.1)
                        energy = max(0, energy - 0.1)
                        happiness = min(1, happiness + 0.1)
                    }
                    .padding()
                    .foregroundColor(.black)
                    .fontDesign(.serif)
                    Button("Nail the dog"){
                        nail = true
                        walk = false
                        bath = false
                        water = false
                        food = false
                        happiness = max(0, happiness - 0.1)
                    }
                    .padding()
                    .foregroundColor(.black)
                    .fontDesign(.serif)
                }.padding()//form
            }//Vstack
            
            if food{
                 Image("food")
                 .resizable()
                 .frame(width: 100, height: 100)
                 .position(x:320,y:200)
                Image("loveHeart")
                .resizable()
                .frame(width: 80, height: 80)
                .position(x:270,y:59)
            }
           if water{
               Image("water")
               .resizable()
               .frame(width: 100, height: 100)
               .position(x:320,y:200)
              Image("loveHeart")
              .resizable()
              .frame(width: 80, height: 80)
              .position(x:270,y:59)
          }
        if bath{
            Image("bath")
            .resizable()
            .frame(width: 100, height: 100)
            .position(x:320,y:200)
           Image("loveHeart")
           .resizable()
           .frame(width: 80, height: 80)
           .position(x:270,y:59)
           
       }
        if walk{
            Image("walk")
            .resizable()
            .frame(width: 100, height: 100)
            .position(x:320,y:200)
           Image("loveHeart")
           .resizable()
           .frame(width: 80, height: 80)
           .position(x:270,y:59)
       }
        if nail{
            Image("nail")
            .resizable()
            .frame(width: 100, height: 100)
            .position(x:320,y:200)
           Image("loveHeart")
           .resizable()
           .frame(width: 80, height: 80)
           .position(x:270,y:59)
        }
  }//Zstack
        .onAppear {
      // Schedule the image to be hidden after 3 seconds
      Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
          self.food = false
          self.water = false
          self.bath = false
          self.walk = false
          self.nail = false
      }
    }//.onAppear
 }//var body
}//sheet
    
    
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        welcomePage()
    }
}

