import Foundation

protocol OutputData {
    func outputData (data: String)
}

protocol InputInterface {
    var buttonDidPress: ((_ operation: String)->())? {get set}
}

protocol CalculatorBrainInterface {
    func digit(value: Double)
    func binary(operation: BinaryOperation)
    func unary(operation: UnaryOperation)
    func utility(operation: UtilityOperation)
    var result: ((Double?, Error?)->())? {get set}
}

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
    case power = "^"
}


