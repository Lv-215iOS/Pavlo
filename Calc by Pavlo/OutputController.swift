//
//  File.swift
//  Calc by Pavlo
//
//  Created by pasik_01 on 12.12.16.
//  Copyright © 2016 pasik. All rights reserved.
//

import UIKit
protocol OutputData {
    func outputData (data: String)
}
class OutputController : UIViewController {
    
    @IBOutlet var displayData: UILabel!
    var zero = "0"
    var userIsInTheMiddleOfTypingANumber = false
    
    var mainVC: ViewController? = nil
    
    func outputData(data: String)  {
        displayData?.text = data
    }
    func appendSymbol(symbol: String) {
        if userIsInTheMiddleOfTypingANumber {
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
