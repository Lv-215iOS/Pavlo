import UIKit

class OutputController : UIViewController {
    
    @IBOutlet var displayData: UILabel!
    var isOperation = 0
    var equalTapped = 0
    var mainVC: ViewController? = nil
    
    func outputData(data: String) {
        displayData?.text = data
    }
    
    func appendSymbol(symbol: String) {
        if (displayData?.text == "+" || displayData?.text == "-" || displayData?.text == "×" || displayData?.text == "÷" || symbol == "^" ) && symbol == "." {
            displayData?.text = (displayData?.text)! + "0."
            return
        }
        
        if (symbol == "+" || symbol == "-" || symbol == "×" || symbol == "÷" || symbol == "^") {
            isOperation = 1
            
        }
        
        if ((displayData?.text?.contains("+"))! || (displayData?.text?.contains("-"))! || (displayData?.text?.contains("×"))! || (displayData?.text?.contains("÷"))! ||  (displayData?.text?.contains("^"))!) && (symbol == "+" || symbol == "-" || symbol == "×" || symbol == "÷" || symbol == "^" )  {
            displayData?.text = ""
            displayData?.text = "error"
            return
        }
        
        if displayData?.text == "0" && (symbol == "+" || symbol == "-" || symbol == "×" || symbol == "÷" || symbol == "^") {
            isOperation = 0
            displayData?.text = ""
            displayData?.text = symbol
            return
        }
        
        if isOperation == 1 && (symbol == "+" || symbol == "-" || symbol == "×" || symbol == "÷" || symbol == "^") && displayData?.text == "error"{
            displayData?.text = ""
            displayData?.text = symbol
        }
        
        if isOperation == 0 && displayData?.text == "0" && symbol != "." && displayData?.text != "error" {
            displayData?.text = ""
            displayData?.text = (displayData?.text!)! + symbol
            
        } else if displayData?.text != "error" {
            displayData?.text = (displayData?.text!)! + symbol
            isOperation = 0
            
        }
        if !(displayData?.text?.isEmpty)! && displayData?.text != "0" && (symbol == "+" || symbol == "-" || symbol == "×" || symbol == "÷" || symbol == "^" ) {
            displayData?.text = ""
            displayData?.text = symbol
        }
        if symbol == "error" {
            displayData?.text = ""
            displayData?.text = "error"
        }
        
    }
}

