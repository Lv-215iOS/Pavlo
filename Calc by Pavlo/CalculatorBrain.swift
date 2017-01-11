import Foundation

class CalculatorBrain: CalculatorBrainInterface {
    internal var result: ((Double?, Error?) -> ())?
    var stack =  [Double]()
    private var inputData = "0"
    private var operationValue = ""
    private var outputData = [String]()
    private var lastInputData: Double?  = nil
    
    func digit(value: Double) {
        inputData += String(Int(value))
        lastInputData = Double(inputData)
    }
    func binary(operation: BinaryOperation) {
        operationValue = operation.rawValue
        if inputData != "" {
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
            if stack.count == 0 {
                return;
            }
            if inputData == "" {
                let res = doMath()
                result?(res, nil)
                if stack.count == 2 {
                    stack.remove(at: 0)
                }
                
            } else {
                if stack.count == 1 {
                    stack.append(lastInputData!)
                    
                } else {
                    stack.append(Double(inputData)!)
                    stack.remove(at: 1)
                }
                let res = doMath()
                result?(res, nil)
            }
            
        } else if operation == .C {
            inputData = "0"
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
            stack.append(stack.remove(at: 0) * stack.removeLast())
        case "÷":
            stack.append(stack.remove(at: 0) / stack.removeLast())
        case "√":
            stack.append(sqrt(stack.remove(at: 0)))
        case "sin":
            stack.append(sin(stack.remove(at: 0)))
        case "cos":
            stack.append(cos(stack.remove(at: 0)))
        case "+/-":
            stack.append((-1) * (stack.remove(at: 0)))
        case "%":
            stack.append(stack.remove(at: 0)/100)
        case "tg":
            stack.append(tan(stack.remove(at: 0)))
        case "ctg":
            stack.append(tanh(stack.remove(at: 0)))
        case "^":
            stack.append(pow(stack.remove(at: 0), stack.removeLast()))
        default: stack.append(stack[0])
            
        }
        return stack[stack.count-1]
        
    }
    
}
