//
//  CalculatorViewController.swift
//  calculator
//
//  Created by admin on 7/4/17.
//  Copyright © 2017 indosystem. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var perfomingMath = false
    var operation = 0
    var temp:String = ""
    
    
    @IBOutlet weak var result_label: UILabel!
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func buttons(_ sender: UIButton){
        
        if (label.text != "" && sender.tag != 10 && sender.tag != 15) {
            if result_label.text != ""{
                previousNumber = Double(result_label.text!)!
            }else{
                previousNumber = Double(label.text!)!
            }
            if sender.tag == 11{ //Divide
                label.text = "/"
            }else if sender.tag == 12 { //Mutiply
                label.text = "X"
            }else if sender.tag == 13 { //Minus
                label.text = "-"
            }else if sender.tag == 14 { //Plus
                label.text = "+"
            }
            operation = sender.tag
            perfomingMath = true
        }else if sender.tag == 15{
            if operation == 11 {
                result_label.text = String(previousNumber / numberOnScreen)
            }else if operation == 12{
                result_label.text = String(previousNumber * numberOnScreen)
            }else if operation == 13{
                result_label.text = String(previousNumber - numberOnScreen)
            }else if operation == 14{
                result_label.text = String(previousNumber + numberOnScreen)
            }
        }else if sender.tag == 10{
            label.text = ""
            result_label.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
            
        }
        
    }
    
    @IBAction func numbers(_ sender: UIButton) {
        if perfomingMath == true {
            label.text = String(sender.tag)
            numberOnScreen = Double(label.text!)!
            perfomingMath = false
        }else{
            label.text = label.text! + String(sender.tag)
            numberOnScreen = Double(label.text!)!
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
