//  Simple Integer Calculator with Swift
//
//  ViewController.swift
//  SwiftCalculator
//
//  Created by Timo Schmidt on 01.08.20
//  Last changed by Timo Schmidt on 06.08.20
//  based on Tutorial by The Swift Guy on YouTube
//  Copyright © 2020 Timo Schmidt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var equalsWasPressed = false
    var applyOperator = false
    var operation = 0
    
    @IBOutlet weak var label: UILabel!
    
    // If any number gets pressed
    @IBAction func numbers(_ sender: UIButton) {
        // Leading 0 isn't displayed
        if sender.tag == 1 && numberOnScreen == 0 {
            label.text! += ""
        }
        else if applyOperator {
            // Leading 0 after operator isn't displayed
            if sender.tag == 1 {
                label.text! += ""
            }
            else {
                label.text = String(sender.tag-1)
                numberOnScreen = Double(label.text!)!
                applyOperator = false
            }
        }
        else {
            // Number after equals (= same as reset)
            if equalsWasPressed {
                previousNumber = 0
                operation = 0
                label.text! = String(sender.tag-1)
                numberOnScreen = Double(label.text!)!
                equalsWasPressed = false
            }
            else {
                label.text! += String(sender.tag-1)
                numberOnScreen = Double(label.text!)!
            }

        }
    }
    
    // If any operator (+,-,/,*) gets pressed
    @IBAction func buttons(_ sender: UIButton) {

        // for multiple calculations before pressing "="
        if operation != 0 {
            if operation == 12 {            // Divide
                let result = previousNumber / numberOnScreen
                label.text = outputNumber(input: result)
             }
             else if operation == 13 {      // Multiply
                 let result = previousNumber * numberOnScreen
                 label.text = outputNumber(input: result)
             }
             else if operation == 14 {      // Minus
                let result = previousNumber - numberOnScreen
                label.text = outputNumber(input: result)
             }
             else if operation == 15 {      // Plus
                let result = previousNumber + numberOnScreen
                label.text = outputNumber(input: result)
             }

        }
        
        if label.text != "" && sender.tag != 11 && sender.tag != 16 {
            previousNumber = Double(label.text!)!
            if sender.tag == 12 {           // Divide
                label.text = "÷"
            }
            else if sender.tag == 13 {      // Multiply
                label.text = "×"
            }
            else if sender.tag == 14 {      // Minus
                label.text = "-"
            }
            else if sender.tag == 15 {      // Plus
                label.text = "+"
            }
            operation = sender.tag
            applyOperator = true
            equalsWasPressed = false
        }
            
        // If "=" gets pressed
        else if sender.tag == 16 {
            if operation == 12 {            // Divide
                let result = previousNumber / numberOnScreen
                label.text = outputNumber(input: result)
             }
             else if operation == 13 {      // Multiply
                 let result = previousNumber * numberOnScreen
                 label.text = outputNumber(input: result)
             }
             else if operation == 14 {      // Minus
                let result = previousNumber - numberOnScreen
                label.text = outputNumber(input: result)
             }
             else if operation == 15 {      // Plus
                let result = previousNumber + numberOnScreen
                label.text = outputNumber(input: result)
             }
            equalsWasPressed = true
        }
            
        // If Reset Button ("C") gets pressed
        else if sender.tag == 11 {  // Reset Button
            // Reset all values and set display to empty String
            label.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }
    }
    
    /**
     Method for displaying the result as either Integer or floating-point number
     */
    func outputNumber(input: Double) -> String {
        if (floor(input) == input) { // if value is integer
            return String(Int(input))
        }
        else {
            return String(input)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

