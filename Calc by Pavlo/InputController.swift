
import UIKit


protocol InputInterface {
    var buttonDidPress: ((_ operation: String)->())? {get set}
}

class InputController: UIViewController, InputInterface {
        
        var buttonDidPress: ((String) -> ())? = nil
        var inputToVC: InputInterface? = nil
    
   
    @IBAction func buttonDidPress(_ sender: UIButton?) {
            buttonDidPress?((sender?.currentTitle)!)
    }
 
    
}

