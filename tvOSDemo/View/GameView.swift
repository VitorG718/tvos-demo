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
    @StateObject var lifeBarManager = LifeBarManager()
    
    var body: some View {
        GeometryReader { metrics in
            ZStack {
                let gameScene: GameScene = {
                    let gameScene = GameScene()
                    gameScene.lifeBarManager = lifeBarManager
                    gameScene.timerManager = timerManager
                    return gameScene
                }()
                
                SpriteView(scene: gameScene, options: <#T##SpriteView.Options#>)
                    .onAppear {
                        timerManager.startTimer()
                    }
                
                VStack {
                    HStack {
                        Rectangle()
                            .fill(Color.green)
                            .frame(width: metrics.size.width * lifeBarManager.lifeBarSize,
                                   height: metrics.size.height * 0.045)
                            .cornerRadius(15.0)
                        
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
