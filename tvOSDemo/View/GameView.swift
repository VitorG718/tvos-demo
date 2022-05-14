//
//  GameView.swift
//  tvOSDemo
//
//  Created by Vitor Gledison Oliveira de Souza on 11/05/22.
//

import SwiftUI
import SpriteKit

struct GameView: View {
    @StateObject var timerManager = TimerManager()
    
    var body: some View {
        GeometryReader { metrics in
            ZStack {
                let gameScene: GameScene = {
                    let gameScene = GameScene()
                    gameScene.timerManager = timerManager
                    return gameScene
                }()
                
                SpriteView(scene: gameScene)
                    .onAppear {
                        timerManager.startTimer()
                    }
                
                VStack {
                    HStack {
                        Spacer()
                        
                        Text(timerManager.timerString)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(30.0)
                            .frame(alignment: .topTrailing)
                    }
                    .padding()
                    
                    Spacer()
                }
                .padding()
            }
        }
        .ignoresSafeArea()
    }
}
