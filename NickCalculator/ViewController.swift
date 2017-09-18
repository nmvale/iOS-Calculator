//
//  ViewController.swift
//  NickCalculator
//
//  Created by Nick Vale on 9/11/17.
//  Copyright © 2017 Nick Vale. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    
    var fNumText = ""
    var sNumText = ""
    var operation = ""
    var numEntered = true
    var operationGo = false
    var clearMe = true
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func plusMinus(_ sender: UIButton) {
        if clearMe {
            outputLabel.text = ""
            clearMe = false
        }
        
        let fNum = Double(fNumText)
        let neg = fNum! * -1
        outputLabel.text = "\(neg)"
    }
    
    
    @IBAction func clearButton(_ sender: UIButton) {
        outputLabel.text = ""
        fNumText = ""
        sNumText = ""
        clearMe = true
    }
    
    
    @IBAction func handleButtonPress(_ sender: UIButton) {
        if clearMe {
            outputLabel.text = ""
            clearMe = false
        }
        
        let textOnScreen = outputLabel.text!
        let labelText = sender.titleLabel?.text
        if let txt = labelText {
            switch txt {
            case "+", "*", "/", "-", "neg":
                if operationGo {
                    return
                }
                operation = txt
                numEntered = false
                operationGo = true
                outputLabel.text = "\(textOnScreen) \(operation) "
                break
                
            case "=":
                numEntered = true
                operationGo = false
                clearMe = true
                let results = calculate()
                outputLabel.text = "\(results)"
                break
                
            default:
                if numEntered {
                    fNumText = "\(fNumText)\(txt)"
                } else {
                    sNumText = "\(sNumText)\(txt)"
                }
                outputLabel.text = "\(textOnScreen)\(txt)"
                break;
            }
        }
    }

    
    func calculate() -> Double {
        let fNum = Double(fNumText)!
        let sNum = Double(sNumText)!
        fNumText = ""
        sNumText = ""
        switch operation {
        case "+":
            return fNum + sNum
        case "-":
            return fNum - sNum
        case "*":
            return fNum * sNum
        case "/":
            return fNum / sNum
        default:
            return 0 }
}
}
/* App code created on tutorial from fnk0 on github: http://www.github.com/fnk0/iOS-Calculator-Tutorial */
