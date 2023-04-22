//
//  ContentView.swift
//  emojiPet
//
//  Created by Lexie Zhou on 20/4/2023.
//

import SwiftUI
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

//store custom color
struct CustomColor {
    static let btnColor = Color("btnColor")
}

//main page view
struct ContentView: View {
    //showing sheet when button is clicked
    @State private var showingSheet = false
    
    var body: some View {
        VStack(spacing: 5) {
            Text(dog_name)
                .padding()
                .font(.custom("Kalam-Bold", size: 34))
            Text("Hunger")
                .font(.custom("Kalam-Regular", size: 20))
                .frame(maxWidth: .infinity, alignment: .leading)
            Image(hunger_bar)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("Energy")
                .font(.custom("Kalam-Regular", size: 20))
                .frame(maxWidth: .infinity, alignment: .leading)
            Image(energy_bar)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("Happiness")
                .font(.custom("Kalam-Regular", size: 20))
                .frame(maxWidth: .infinity, alignment: .leading)
            Image(happiness_bar)
                .resizable()
                .aspectRatio(contentMode: .fit)
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
                                    Sheet()
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
    
    var body: some View {
        ZStack{
            VStack(
                alignment: .center
            ){
                HStack {
                    VStack(spacing: 2){
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
                        Text("Hunger")
                            .font(.custom("Kalam-Regular", size: 20))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Image(hunger_bar)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Text("Energy")
                            .font(.custom("Kalam-Regular", size: 20))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Image(energy_bar)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Text("Happiness")
                            .font(.custom("Kalam-Regular", size: 20))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Image(happiness_bar)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
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
        ContentView()
    }
}

