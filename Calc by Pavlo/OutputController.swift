
import UIKit
protocol OutputData {
    func outputData (data: String)
}
class OutputController : UIViewController {
    
    @IBOutlet var displayData: UILabel!
    var userIsInTheMiddleOfTypingANumber = false
    
    var mainVC: ViewController? = nil
    
    func outputData(data: String)  {
        displayData?.text = data
    }
    func appendSymbol(symbol: String) {
        if displayData.text == "0" {
            displayData?.text = ""
            displayData?.text = symbol
            
        } else   {
            displayData?.text = (displayData?.text!)! + symbol
            
        }
        userIsInTheMiddleOfTypingANumber = true
        
    }
    func  clearDispaly () {
        displayData?.text = ""
    }
}
