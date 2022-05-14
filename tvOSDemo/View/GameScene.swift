//
//  GameScene.swift
//  tvOSDemo
//
//  Created by Vitor Gledison Oliveira de Souza on 11/05/22.
//

import SpriteKit

final class GameScene: SKScene {
    
    private var factory = Factory.shared
    private var player: SKSpriteNode!
    var timerManager: TimerManager?
    private var timer: Timer?
    
    override func sceneDidLoad() {
        backgroundColor = .blue
        player = factory.createSpaceShip(CGPoint(x: frame.midX, y: frame.midY))
        addChild(player)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        var position = touch.location(in: self)
        position = validatePosition(position)
        player.position = position
    }
    
    override func didMove(to view: SKView) {
        timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true, block: { [weak self] _ in
            if let self = self {
                self.factory.createAsteroid(in: self)                
            }
        })
    }
    
    private func validatePosition(_ point: CGPoint) -> CGPoint {
        var finalPosition: CGPoint = point
        if point.x > 1.0 {
            finalPosition.x = 1.0
        } else if point.x < 0.0 {
            finalPosition.x = 0.0
        }
        
        if point.y > 1.0 {
            finalPosition.y = 1.0
        } else if point.y < 0.0 {
            finalPosition.y = 0.0
        }
        
        return finalPosition
    }
}
