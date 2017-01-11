import UIKit

class ViewController: UIViewController  {
    
    var outputController: OutputController? = nil
    var inputController: InputController? = nil
    var calcBrain = CalculatorBrain()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OutputControllerEmbedSegue" {
            outputController = segue.destination as? OutputController
            outputController?.mainVC = self
        } else if segue.identifier == "InputControllerEmbedSegue" {
            inputController = segue.destination as? InputController
            inputController?.buttonDidPress = { [unowned self] operation in
                self.buttonDidPress(operation: operation)
            }
        }
    }
    
    func buttonDidPress(operation: String) {
        
        switch operation {
        case "+":
            calcBrain.binary(operation: .Plus)
            outputController?.appendSymbol(symbol: operation)
        case "-":
            calcBrain.binary(operation: .Minus)
            outputController?.appendSymbol(symbol: operation)
        case "×":
            calcBrain.binary(operation: .Mul)
            outputController?.appendSymbol(symbol: operation)
        case "÷":
            calcBrain.binary(operation: .Div)
            outputController?.appendSymbol(symbol: operation)
        case "cos":
            calcBrain.unary(operation: .cos)
            calcBrain.utility(operation: .Equal)
        case "sin":
            calcBrain.unary(operation: .sin)
            calcBrain.utility(operation: .Equal)
        case "tg":
            calcBrain.unary(operation: .tg)
            calcBrain.utility(operation: .Equal)
        case "ctg":
            calcBrain.unary(operation: .ctg)
            calcBrain.utility(operation: .Equal)
        case "^":
            calcBrain.unary(operation: .power)
            outputController?.appendSymbol(symbol: operation)
        case "%":
            calcBrain.unary(operation: .percentage)
            calcBrain.utility(operation: .Equal)
        case "+/-":
            calcBrain.unary(operation: .changeSign)
            calcBrain.utility(operation: .Equal)
        case ".":
            calcBrain.utility(operation: .Dot)
            outputController?.appendSymbol(symbol: operation)
        case "=":
            calcBrain.utility(operation: .Equal)
        case "C":
            calcBrain.utility(operation: .C)
            outputController?.outputData(data: "0")
        case "√":
            calcBrain.unary(operation: .sqrt)
            calcBrain.utility(operation: .Equal)
        case "error":
            calcBrain.utility(operation: .C)
            outputController?.appendSymbol(symbol: "error")
        default:
            outputController?.appendSymbol(symbol: operation)
            calcBrain.digit(value: Double(operation)!)
            break
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calcBrain.result = { (value, error)->() in
            if (value != nil) {
                if (value!.isNaN) || (value!.isInfinite)
                    
                {
                    self.outputController?.outputData(data: "Помилка")
                    
                }
                self.outputController?.outputData(data: NSString (format: "%g", value!) as String)
            }
        }
        
    }
    override var prefersStatusBarHidden: Bool {
        return false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}

