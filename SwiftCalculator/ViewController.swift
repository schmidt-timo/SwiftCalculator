//  Simple Integer Calculator with Swift
//
//  ViewController.swift
//  SwiftCalculator
//
//  Created by Timo Schmidt on 01.08.20
//  based on Tutorial by The Swift Guy on YouTube
//  Copyright © 2020 Timo Schmidt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen = 0
    var previousNumber = 0
    
    var applyOperator = false
    var operation = 0
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        if applyOperator == true {
            label.text = String(sender.tag-1)
            numberOnScreen = Int(label.text!)!
            applyOperator = false
        }
        else {
            label.text! += String(sender.tag-1)
            numberOnScreen = Int(label.text!)!
        }
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        // If any operator (+,-,/,*) gets pressed
        if label.text != "" && sender.tag != 11 && sender.tag != 16 {
            previousNumber = Int(label.text!)!
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
        }
        // If "=" gets pressed
        else if sender.tag == 16 {
            if operation == 12 {            // Divide
                 label.text = String(previousNumber / numberOnScreen)
             }
             else if operation == 13 {      // Multiply
                 label.text = String(previousNumber * numberOnScreen)
             }
             else if operation == 14 {      // Minus
                label.text = String(previousNumber - numberOnScreen)
             }
             else if operation == 15 {      // Plus
                label.text = String(previousNumber + numberOnScreen)
             }
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

