//
//  ViewController.swift
//  Calc by Pavlo
//
//  Created by pasik_01 on 07.12.16.
//  Copyright © 2016 pasik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    var firstNumberText = ""
    var secondNumberText = ""
    var op = ""
    var isFirstNumber = true
    var hasOp = false
    var canClear = true
    
    var operandStack = [Double]()
    var operatorSymbol: String?
    var userIsInTheMiddleOfTypingANumber = false
    
    var displayValue: Double {
        get {
            return Double(calcDisplay.text!)!
        }
        set {
            
            if newValue == floor(newValue) {
                calcDisplay.text = "\(Int(newValue))"
            } else {
                calcDisplay.text = "\(newValue)"
            }
            
            userIsInTheMiddleOfTypingANumber = false
        }
    }

    @IBOutlet weak var calcDisplay: UILabel!
    
    @IBAction func numberTapped(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            calcDisplay.text! += digit
        } else {
            calcDisplay.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
    }
    @IBAction func operateTapped(_ sender: UIButton) {
        userIsInTheMiddleOfTypingANumber = false
        operatorSymbol = sender.currentTitle!
        operandStack.append(displayValue)
        
    }
    @IBAction func eqaulTapped() {
        if operatorSymbol != nil {
            userIsInTheMiddleOfTypingANumber = false
            operandStack.append(displayValue)
            
            switch operatorSymbol! {
            case "+": performOperation() { $0 + $1 }
            case "-": performOperation() { $1 - $0 }
            case "×": performOperation() { $0 * $1 }
            case "÷": performOperation() { $1 / $0 }
            case "√": performOperation() { sqrt($0) }
            case "cos": performOperation(){ cos($0) }
            case "sin": performOperation(){ sin($0) }
            case "+/-": performOperation(){ 0-$1 }
                
            default: break
            }
        }
        
    }
    func performOperation( operation: (Double, Double) -> Double)  {
        displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
        operandStack.append(displayValue)
    }
   private func performOperation( operation: (Double) -> Double){
            displayValue = operation(operandStack.removeLast())
            operandStack.append(displayValue)
    
    }
    
    
    @IBAction func clearTapped() {
        operandStack.removeAll()
        userIsInTheMiddleOfTypingANumber = false
        operatorSymbol = nil
        displayValue = 0
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

