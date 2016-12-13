//
//  File.swift
//  Calc by Pavlo
//
//  Created by pasik_01 on 12.12.16.
//  Copyright © 2016 pasik. All rights reserved.
//

import UIKit
protocol OutputData {
    func output ()
}
class OutputController : UIViewController {
   
    @IBOutlet var displayData: UILabel?
    
    var mainVC: ViewController? = nil
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "OutputControllerEmbedSegue"{
            mainVC = segue.destination as? ViewController
        }
        
    }
    
}
