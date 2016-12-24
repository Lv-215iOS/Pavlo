
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

class CalculatorBrain: NSObject, CalculatorBrainInterface {
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
            if stack.count == 0 {
                return;
            }
            if inputData == "" {
                let res = doMath()
                result?(res, nil)
            } else {
                if stack.count == 1 {
                    stack.append(lastInputData!)
                    
                } else {
                    stack.append(Double(inputData)!)
                    inputData = ""
                }
                let res = doMath()
                result?(res, nil)
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
            stack.append(stack.remove(at: 0) / stack.removeLast())
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
        case "tg":
            stack.append(tan(stack.removeLast()))
        case "ctg":
            stack.append(tanh(stack.removeLast()))
        case "x^y":
            stack.append(pow(stack.remove(at: 0), stack.removeLast()))
        default: stack.append(stack[0])
            
        }
        return stack[stack.count-1]
        
    }
    
}
