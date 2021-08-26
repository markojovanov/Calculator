//
//  ViewController.swift
//  Calculator
//
//  Created by Marko Jovanov on 26.8.21.
//

import UIKit

class ViewController: UIViewController {
    private var isFinishedTypingNumber: Bool = true
    @IBOutlet weak var displayLabel: UILabel!
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double.")
            }
            return number
        }
        set {
            if String(newValue) == "inf" {
                displayLabel.text = "Not a number"
            } else if floor(newValue) == newValue {
                displayLabel.text = String(Int(newValue))
            } else {
                displayLabel.text = String(newValue)
            }
        }
    }
    private var calculator = CalculatLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        calculator.setNumber(displayValue)
        if let calcMethod = sender.currentTitle {
            if let number = calculator.calculate(symbol: calcMethod) {
                    displayValue = number
            }
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                if numValue == "." {
                    displayLabel.text = "0\(numValue)"
                } else {
                    displayLabel.text = numValue
                }
                isFinishedTypingNumber = false
            } else {
                if numValue == "." {
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                displayLabel.text?.append(numValue)
            }
        }
    }
    
}

