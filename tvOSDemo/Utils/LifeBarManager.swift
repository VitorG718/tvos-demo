//
//  LifeBarManager.swift
//  tvOSDemo
//
//  Created by Vitor Gledison Oliveira de Souza on 11/05/22.
//

import Foundation
import CoreGraphics

final class LifeBarManager: ObservableObject {
    @Published private(set) var lifeBarSize: CGFloat = 0.45
    
    var isEmpty: Bool { lifeBarSize == 0.0 }
    
    func increaseToFullValue() {
        lifeBarSize = 0.45
    }
    
    func decrease() {
        lifeBarSize -= 0.05
    }
}
