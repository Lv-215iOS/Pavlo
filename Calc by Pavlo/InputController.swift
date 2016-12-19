//
//  ContainerView.swift
//  Calc by Pavlo
//
//  Created by pasik_01 on 12.12.16.
//  Copyright © 2016 pasik. All rights reserved.
//

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

