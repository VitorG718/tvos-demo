//
//  Factory.swift
//  tvOSDemo
//
//  Created by Vitor Gledison Oliveira de Souza on 11/05/22.
//

import SwiftUI
import SpriteKit

enum NodeNames: String {
    case player
    case enemy
    
    var name: String { rawValue }
}

final class Factory {
    static let shared = Factory()
    private let defaultNodesSize = CGSize(width: 0.05, height: 0.1)
    
    private init() { }
    
    func createSpaceShip(_ position: CGPoint) -> SKSpriteNode {
        let spaceShip = SKSpriteNode(color: .red, size: defaultNodesSize)
        spaceShip.position = position
        spaceShip.name = NodeNames.player.name
        return spaceShip
    }
    
    func createAsteroid(in scene: SKScene) {
        let asteroid = SKSpriteNode(color: .brown, size: defaultNodesSize)
        asteroid.position = PositionGenerator.randomOutOfBounds()
        asteroid.name = NodeNames.enemy.name
        
        let duration = Double.random(in: (0.8)...(1.9))
        asteroid.run(.move(to: PositionGenerator.randomOutOfBounds(), duration: duration))
        
        scene.addChild(asteroid)
    }
}
