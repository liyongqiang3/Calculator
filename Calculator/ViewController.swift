//
//  ViewController.swift
//  Calculator
//
//  Created by 李永强 on 15/6/9.
//  Copyright (c) 2015年 tongbaotu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!

    var  flag  = false ;


    @IBAction func appendDigit(sender: UIButton) {
        let digit =  sender.currentTitle!
        if flag {
            display.text  = display.text! + digit

        } else {
            display.text = digit
            flag = true
        }
    }
    var operandstack = Array<Double>()

    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if flag {
            enterButtonEVent()
        }
        switch operation{
        case "+":performOperation { $0 + $1 }

        case "−":performOperation(subtraction)
        case "×":performOperation(multiply)

        case "÷":performOperation(division)

        default :break
        }

    }
    func performOperation(operation:(Double,Double)->Double){
        if operandstack.count >=  2{
            displayValue = operation(operandstack.removeLast(),operandstack.removeLast())

            enterButtonEVent()

        }
    }
    func  plus(op1:Double,op2:Double)->Double{
        return op1  +  op2
    }
    func  subtraction(op1:Double,op2:Double)->Double{
        return op1  -  op2
    }

    func  multiply(op1:Double,op2:Double)->Double{
        return op1  *  op2
    }
    func  division(op1:Double,op2:Double)->Double{
        return op1  /  op2
    }


    @IBAction func enterButtonEVent() {
        flag = false
        println("text = \(display.text)")
        operandstack.append(displayValue)
        println("operandstack = \(operandstack)")
    }
    var displayValue:Double{
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
            flag = false
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do a ny additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

