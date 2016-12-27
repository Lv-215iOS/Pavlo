
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
    case tg  = "tg"
    case ctg = "ctg"
    case changeSign = "+/-"
    case percentage = "%"
    case power = "x^y"
}

protocol CalculatorBrainInterface {
    func digit(value: Double)
    func binary(operation: BinaryOperation)
    func unary(operation: UnaryOperation)
    func utility(operation: UtilityOperation)
    var result: ((Double?, Error?)->())? {get set}
}

class CalculatorBrain: CalculatorBrainInterface {
    internal var result: ((Double?, Error?) -> ())?
    
    var stack =  [Double]()
    private var inputData = ""
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
                print ("sadmhabsd")
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
                   // inputData = ""
                }
                let res = doMath()
                result?(res, nil)
                //stack.remove(at: 1)
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
        case "x^y":
            stack.append(pow(stack.remove(at: 0), stack.removeLast()))
        default: stack.append(stack[0])
            
        }
        return stack[stack.count-1]
        
    }
    
}
