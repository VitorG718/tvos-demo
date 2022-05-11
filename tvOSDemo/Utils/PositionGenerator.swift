//
//  PositionGenerator.swift
//  tvOSDemo
//
//  Created by Vitor Gledison Oliveira de Souza on 11/05/22.
//

import Foundation
import CoreGraphics

class PositionGenerator {
    static func random() -> CGPoint {
        let positionX = Double.random(in: 0...1.0)
        let positionY = Double.random(in: 0...1.0)
        return CGPoint(x: positionX, y: positionY)
    }
    
    static func randomOutOfBounds() -> CGPoint {
        let sector = Int.random(in: 1...4)
        var position: CGPoint = .zero
        
        switch sector {
        case 1:
            position.y = Double.random(in: 0...1.0)
            position.x = -0.1
        case 2:
            position.y = 1.1
            position.x = Double.random(in: 0...1.0)
        case 3:
            position.y = Double.random(in: 0...1.0)
            position.x = 1.1
        case 4:
            position.y = -0.1
            position.x = Double.random(in: 0...1.0)
        default:
            break
        }
        
        return position
    }
}
