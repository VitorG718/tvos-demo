//
//  TimerManager.swift
//  tvOSDemo
//
//  Created by Vitor Gledison Oliveira de Souza on 11/05/22.
//

import Foundation

final class TimerManager: ObservableObject {
    @Published private(set) var timerString: String = "00:00"
    private var timerCount: Int = 0
    private var timerObject: Timer?
    
    func startTimer() {
        timerObject = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [weak self] _ in
            guard let self = self else {
                return
            }
            self.timerCount += 1
            self.timerString = self.timerIntToString(self.timerCount)
        })
    }
    
    func stopTimer() {
        timerObject?.invalidate()
        timerObject = nil
    }
    
    func resetTimer() {
        stopTimer()
        timerCount = 0
        timerString = "00:00"
    }
    
    private func timerIntToString(_ timerCount: Int) -> String {
        let firstPart = timerCount / 60
        let secondPart = timerCount % 60
        return String(format: "%02i:%02i", firstPart, secondPart)
    }
}
