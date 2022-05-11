//
//  ContentView.swift
//  tvOSDemo
//
//  Created by Vitor Gledison Oliveira de Souza on 10/05/22.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    @State var presentGameView: Bool = false
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
            Button {
                presentGameView = true
            } label: {
                Text("Start Game")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(15)
        }
        .fullScreenCover(isPresented: $presentGameView) {
            GameView()
                .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
