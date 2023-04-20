//
//  ContentView.swift
//  emojiPet
//
//  Created by 周子涵 on 20/4/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Cookie").padding()
            Text("Hunger")
            Image("10%")
            Text("Hunger")
            Image("10%")
            Spacer()
            Text("Hunger")
            Image("10%")
            Spacer()
            Button("Take Care of it"){
                
            }
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
