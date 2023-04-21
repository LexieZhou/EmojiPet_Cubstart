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
    
    var body: some View {
        VStack(
            alignment: .center
        ){
            HStack {
                VStack(spacing: 2){
                    Button{
                        dismiss();
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
                }.padding()
                Image("main_pet")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }.padding()
            
            
            Form {
                Button("Feed the dog food"){
                }
                    .padding()
                    .foregroundColor(.black)
                    .fontDesign(.serif)
                Button("Feed the dog water"){
                }
                    .padding()
                    .foregroundColor(.black)
                    .fontDesign(.serif)
                Button("Bath the dog"){
                }
                    .padding()
                    .foregroundColor(.black)
                    .fontDesign(.serif)
                Button("Walk the dog"){
                }
                    .padding()
                    .foregroundColor(.black)
                    .fontDesign(.serif)
                Button("Nail the dog"){
                }
                    .padding()
                    .foregroundColor(.black)
                    .fontDesign(.serif)
            }.padding()
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
