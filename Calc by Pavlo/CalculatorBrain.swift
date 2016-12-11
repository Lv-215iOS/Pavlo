//
//  CalculatorBrain.swift
//  Calc by Pavlo
//
//  Created by pasik_01 on 11.12.16.
//  Copyright © 2016 pasik. All rights reserved.
//

import Foundation

enum BinaryOperation: String   {
    case Plus = "+"
    case Minus = "-"
    case Mul = "*"
    case Div = "/"
}

enum UtilityOperation: String {
    case Equal = "="
    case C = "C"
    case Dot = "."
}
enum UnaryOperation: String{
    case sqrt = "√"
    case sin = "sin"
    case cos = "cos"
    case changeSign = "+/-"
}

protocol CalculatorBrainInterface {
    func digit(value: Double)
    func binary(operation: BinaryOperation)
    func unary(operation: UnaryOperation)
    func utility(operation: UtilityOperation)
    var result: ((Double?, Error?)->())? {get set}
}

class CalculatorBrain: NSObject, CalculatorBrainInterface {
    var operandOne: Double?
    var operandTwo: Double?
    var value: Double?
    
    func digit(value: Double) {
        if operandOne == nil {
            operandOne = value
        } else if operandTwo == nil {
            operandTwo = value
        }
    }
    
    func binary(operation: BinaryOperation) {
        switch operation {
        case .Plus:
            value = (operandOne ?? 0.0) + (operandTwo ?? 0.0)
        case .Minus:
            value = (operandOne ?? 0.0) - (operandTwo ?? 0.0)
        case .Mul:
            value = (operandOne ?? 0.0) *  (operandTwo ?? 0.0)
        case .Div:
            value = (operandOne ?? 0.0) /  (operandTwo ?? 0.0)
            
        default: break
            
        }
        
        
    }
    
    func unary(operation: UnaryOperation) {
        switch operation {
        case .sqrt:
            value = (sqrt (operandOne ?? 0.0 ))
        case .sin:
            value = (sin (operandOne ?? 0.0 ))
        case .cos:
            value = (cos(operandOne ?? 0.0 ))
        case .changeSign:
            value = 0 - (operandOne ?? 0.0)
        default:
            break
        }
        
    }
    
    func utility(operation: UtilityOperation) {
        switch operation {
        case .Equal:
            result?(value, nil)
        default: break
        }
    }
    
    var result: ((Double?, Error?)->())? = nil
}

var calc = CalculatorBrain()

//calc.result = { (value, error)->() in
//    print("Result: \(value)")
//}
//
//calc.digit(value: 6)
//calc.digit(value:7)
//calc.binary(operation: .Minus)
//calc.utility(operation: .Equal)



