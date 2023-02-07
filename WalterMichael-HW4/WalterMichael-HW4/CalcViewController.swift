//
//  CalcViewController.swift
//  WalterMichael-HW4
//
//  Created by Michael  Walter on 10/2/21.
//
// Project: WalterMichael-HW4
// EID: MJW3895
// Course: CS329E

import UIKit

class CalcViewController: UIViewController {
    @IBOutlet weak var resultButton: UILabel!
    @IBOutlet weak var OperatorLabel: UILabel!
    @IBOutlet weak var Operand1TextField: UITextField!
    @IBOutlet weak var Operand2TextField: UITextField!
    var oper = String()
    var teamIndex = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultButton.textAlignment = .center
    }
    
    @IBAction func CalcButtonPressed(_ sender: Any) {
        let a = Int(Operand1TextField.text!)
        let b = Int(Operand2TextField.text!)
        if (a is Int && b is Int){
            if (oper == "Add"){
                resultButton.text = String(a!+b!)
            }
            else if (oper == "Subtract"){
                resultButton.text = String(a!-b!)
            }
            else if (oper == "Divide"){
                if (a!  == 0) || (b! == 0){
                    resultButton.text = "no"
                }
                else{
                resultButton.text = String(a!/b!)
                }
            }
            else if (oper == "Multiply"){
                resultButton.text = String(a!*b!)
            }
        }
        
        else{
            var a = Float(Operand1TextField.text!)
            var b = Float(Operand2TextField.text!)
            if (oper == "Add"){
                resultButton.text = String(a!+b!)
            }
            else if  (oper == "Subtract"){
                resultButton.text = String(a!-b!)
            }
            else if (oper == "Divide"){
                resultButton.text = String(a!/b!)
            }
            else if  (oper == "Multiply"){
                resultButton.text = String(a!*b!)
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if (oper == "Add"){
            OperatorLabel.text = "+"
        }
        if (oper == "Subtract"){
            OperatorLabel.text = "-"
        }
        if (oper == "Divide"){
            OperatorLabel.text = "/"
        }
        if (oper == "Multiply"){
            OperatorLabel.text = "*"
        }
    }
}
