//
//  ViewController.swift
//  Calculator
//
//  Created by Mohan, Kishore Kumar on 6/27/14.
//  Copyright (c) 2014 swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var firstEntry: NSString?
    var isUserInMiddleOfTypingNumbers:Bool?
    var didUserPressedOperation:Bool?
    var op:String?
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        self.clear()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBOutlet var displayLabel: UILabel
    
    @IBAction func digitPressed(sender: UIButton) {
        if didUserPressedOperation {
            displayLabel.text = ""
            didUserPressedOperation = nil
        }
        
        if isUserInMiddleOfTypingNumbers {
            displayLabel.text = displayLabel.text + sender.currentTitle
        } else {
            displayLabel.text = sender.currentTitle
            isUserInMiddleOfTypingNumbers = true
        }
    }
    
    @IBAction func operationPressed(sender: UIButton) {
        op = sender.currentTitle
        firstEntry = displayLabel.text
        didUserPressedOperation = true
    }
    
    @IBAction func clearPressed(sender: UIButton) {
        self.clear()
    }
    
    func clear() {
        firstEntry = nil
        isUserInMiddleOfTypingNumbers = nil
        didUserPressedOperation = nil
        displayLabel.text = "0"
    }
    
    @IBAction func equalPressed(sender: UIButton) {
        var secondEntry:NSString = displayLabel.text
       
        if(op == "+") {
            displayLabel.text = String((firstEntry?.doubleValue)! + (secondEntry.doubleValue))
        } else if(op == "-") {
            displayLabel.text = String((firstEntry?.doubleValue)! - (secondEntry.doubleValue))
        } else if(op == "x") {
            displayLabel.text = String((firstEntry?.doubleValue)! * (secondEntry.doubleValue))
        } else if(op == "/") {
            displayLabel.text = String((firstEntry?.doubleValue)! / (secondEntry.doubleValue))
        }
        
        firstEntry = ""
        isUserInMiddleOfTypingNumbers = nil
        didUserPressedOperation = nil
    }
}

