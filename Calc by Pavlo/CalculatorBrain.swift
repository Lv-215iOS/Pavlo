//
//  CalculatorBrain.swift
//  Calc by Pavlo
//
//  Created by pasik_01 on 11.12.16.
//  Copyright © 2016 pasik. All rights reserved.
//

import Foundation

enum BinaryOperation: String  {
    case Plus = "+"
    case Minus = "-"
    case Mul = "×"
    case Div = "÷"
}

enum UtilityOperation: String {
    case Equal = "="
    case C = "C"
    case Dot = "."
}

enum UnaryOperation: String {
    case sqrt = "√"
    case sin = "sin"
    case cos = "cos"
    case changeSign = "+/-"
    case percentage = "%"
}

protocol CalculatorBrainInterface {
    func digit(value: Double)
    func binary(operation: BinaryOperation)
    func unary(operation: UnaryOperation)
    func utility(operation: UtilityOperation)
    var result: ((Double?, Error?)->())? {get set}
}

class CalculatorBrain: NSObject, CalculatorBrainInterface {
    internal var result: ((Double?, Error?) -> ())?

    var stack =  [Double]()
    private var inputData = ""
    private var operationValue = ""
    private var outputData = [String]()
    
    func digit(value: Double) {
        inputData += String(Int(value))
    }
    func binary(operation: BinaryOperation) {
        operationValue = operation.rawValue
        if inputData != ""{
        stack.append(Double(inputData)!)
        inputData = ""
        }
    }
    func unary(operation: UnaryOperation) {
        operationValue = operation.rawValue
        if inputData != "" {
            stack.append(Double(inputData)!)
            inputData = ""
        }    }
    
    func utility(operation: UtilityOperation) {
        if operation == .Equal {
            if inputData == "" {
            let res = doMath()
            result?(res, nil)
            print("Result: \(res)")
            } else {
                stack.append(Double(inputData)!)
                inputData = ""
                let res = doMath()
                result?(res, nil)
    
                print("Result: \(res)")
            }
        } else if operation == .C {
            inputData = ""
            stack.removeAll()
        }  else {
            inputData += operation.rawValue
        }
    }
    
    func doMath ()->Double {
        
            switch operationValue {
            case "+":
               stack.append(stack.removeLast() + stack.removeLast())
            case "-":
                stack.append(stack.remove(at: 0) - stack.removeLast())
            case "×":
                stack.append(stack.removeLast() * stack.removeLast())
            case "÷":
                stack.append(stack.remove(at: 0) - stack.removeLast())
            case "√":
                stack.append(sqrt(stack.removeLast()))
            case "sin":
                stack.append(sin(stack.removeLast()))
            case "cos":
                stack.append(cos(stack.removeLast()))
            case "+/-":
                stack.append(0 - stack.removeLast())
            case "%":
                stack.append(stack.removeLast()/100)
            default:stack.append(stack[0])
            
        }
        return stack[stack.count-1]
        
    }
    
    
    
}
