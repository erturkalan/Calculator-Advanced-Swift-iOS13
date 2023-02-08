//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTyping: Bool = true
    
    private var displayValue: Double {
        get{
            guard let number = Double(displayLabel.text!) else{
                fatalError("Can not convert display label to Double")
            }
            return number
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculatorLogic = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
       
        isFinishedTyping = true
        
        if let calcMethod = sender.currentTitle {
           
            calculatorLogic.setNumber(displayValue)
            if let result = calculatorLogic.calculate(symbol: calcMethod) {
                displayValue = result
            }
        }
    
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            
            if isFinishedTyping {
                displayLabel.text = sender.currentTitle
                isFinishedTyping = false
            }else{
                
                if numValue == "." {
        
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    
    }

}

