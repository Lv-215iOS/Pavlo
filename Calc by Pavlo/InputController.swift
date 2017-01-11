import UIKit
import AVFoundation
import AudioToolbox

class InputController: UIViewController, InputInterface {
    
    var buttonDidPress: ((String) -> ())? = nil
    var isDot = 0
    var symbol = ""
    var isOperation = 0
    var equalTapped = 0
    var clearTapped = 1
    var audioPlayerForButtons = AVAudioPlayer()
    
    
    @IBAction func buttonDidPress(_ sender: UIButton?) {
        
        symbol =  (sender?.currentTitle)!
        if symbol == "C" {
            isDot = 0
            isOperation = 0
            equalTapped = 0
            clearTapped = 0
        }
        
        if symbol == "." && isDot == 1 {
            print("1")
            return
        }
        
        if symbol == "." && isDot == 0 {
            print("2")
            isDot = 1
            
        }
        
        if isOperation == 1 && symbol == "=" && clearTapped == 1 {
            print("3")
            buttonDidPress?(("error"))
            return
        }
        
        if symbol == "=" && isOperation == 0 && clearTapped == 0 {
            print("4")
            isOperation = 0
            equalTapped = 1
            isDot = 1
            
        }
        
        if symbol == "=" {
            isOperation = 0
            isDot = 1
        }
        
        if symbol == "." && equalTapped == 1 {
            equalTapped = 0
            buttonDidPress?(("error"))
            return
        }
        
        if (symbol == "+" || symbol == "-" || symbol == "×" || symbol == "÷" || symbol == "^") && isOperation == 1  {
            print("5")
            return
        }
        
        if symbol == "cos" || symbol == "sin" || symbol == "tg" || symbol == "ctg" || symbol == "√" || symbol == "^" || symbol == "%" {
            isDot = 1
        }
        
        if equalTapped == 1 && (symbol == "1" || symbol == "2" || symbol == "3" || symbol == "4" || symbol == "5" || symbol == "6" || symbol == "7" || symbol == "8" || symbol == "9" || symbol == "0") {
            return
        }
        
        if (symbol == "+" || symbol == "-" || symbol == "×" || symbol == "÷" || symbol == "^") && isOperation == 0 {
            clearTapped = 1
            isOperation = 1
            isDot = 0
            print("6")
            buttonDidPress?((sender?.currentTitle)!)
            return
            
            
        }
        
        if clearTapped == 1 {
            clearTapped = 0
        }
        
        AudioServicesPlaySystemSound(SystemSoundID(1103))
        buttonDidPress?((sender?.currentTitle)!)
    }
    
    
}

