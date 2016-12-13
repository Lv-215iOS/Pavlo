//
//  ContainerView.swift
//  Calc by Pavlo
//
//  Created by pasik_01 on 12.12.16.
//  Copyright © 2016 pasik. All rights reserved.
//

import UIKit


//protocol InputToVC {
//    func changeLabel(text: String)
//}

class InputController: UIViewController {
        

    var mainVC: ViewController? = nil
    //var inputToVC: InputToVC? = nil
    //var userIsInTheMiddleOfTypingANumber = false
   
    
    @IBAction func numberTapped(_ sender: UIButton?) {
        mainVC?.numberTapped(operation: (sender?.currentTitle)!)
    }

//        inputToVC?.changeLabel(text: "test")
        
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "InputControllerEmbedSegue"{
            mainVC = segue.destination as? ViewController
        }
        
    }
    
        

}

