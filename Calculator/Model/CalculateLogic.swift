//
//  CalculateLogic.swift
//  Calculator
//
//  Created by Marko Jovanov on 26.8.21.
//

import Foundation

struct CalculatLogic {
    private var number: Double?
    private var intermediateCalculation: (num1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
                case "+/-":
                    return n * -1
                case "%":
                    return n / 100
                case "AC":
                    return 0
                case "=":
                    if intermediateCalculation == nil {
                        return 0
                    } else {
                        return performTwoNumCalculation(n2: n)!
                    }
                default:
                    intermediateCalculation = (num1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    private func performTwoNumCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.num1,
           let operation = intermediateCalculation?.calcMethod {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The operation passed in does not match any of the cases.")
            }
        }
        return nil
    }
}
