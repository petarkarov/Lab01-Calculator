//
//  ViewController.swift
//  Calculator
//
//  Created by Petar Karov on 3/21/19.
//  Copyright © 2019 Petar Karov. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    

    var numberOnScreen = 0.0
    var previousNumber = 0.0
    var operation = 0
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.text = ""
        textField.clearButtonMode = .always
        textField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        numberOnScreen = 0.0
        previousNumber = 0.0
        operation = 0
        return true
    }
    
    
    @IBAction func numberClicked(_ sender: UIButton) {
        if sender.tag == 99{
            if textField.text != ""{
                textField.text?.append(".")
            }
            return
        }
        if numberOnScreen == 0 {
            self.textField.text = ""
        }
        if let text = textField.text{
            let string = text + String(sender.tag - 1)
            textField.text = string
            if let num = Double(string){
                self.numberOnScreen = num
            }
        }
    }
    
    @IBAction func signClicked(_ sender: UIButton) {
        if textField.text != ""{
            switch sender.tag {
            case 1:
                textField.text = "+"
            case 2:
                textField.text = "-"
            case 3:
                textField.text = "*"
            case 4:
                textField.text = "/"
            default:
                return
            }
            self.previousNumber = self.numberOnScreen + self.previousNumber
            self.numberOnScreen = 0
            operation = sender.tag
        }
    }
    
    @IBAction func equalsClicked(_ sender: UIButton) {
        if previousNumber != 0 && numberOnScreen != 0 {
            switch operation {
            case 1:
                textField.text = String(previousNumber + numberOnScreen)
                numberOnScreen = previousNumber + numberOnScreen
            case 2:
                textField.text = String(previousNumber - numberOnScreen)
                numberOnScreen = previousNumber - numberOnScreen
                
            case 3:
                textField.text = String(previousNumber * numberOnScreen)
                numberOnScreen = previousNumber * numberOnScreen
                
            case 4:
                textField.text = String(previousNumber / numberOnScreen)
                numberOnScreen = previousNumber / numberOnScreen
            default:
                return
            }
            previousNumber = 0
        }
    }
}

