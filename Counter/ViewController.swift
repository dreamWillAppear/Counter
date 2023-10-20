//
//  ViewController.swift
//  Counter
//
//  Created by dreamlogin on 19.10.2023.
//

import UIKit
var counterValue  = 0


class ViewController: UIViewController {
    @IBOutlet weak var plusButtonImage: UIImageView!
    @IBOutlet weak var minusButtonImage: UIImageView!
    @IBOutlet weak var resetButtonImage: UIImageView!
    @IBOutlet weak var counterDisplay: UILabel!
    

    @IBAction func plusButton(_ sender: Any) {
        counterValue += 1
        counterDisplay.text = String(counterValue)
        plusButtonImage.addSymbolEffect(.bounce.down.byLayer)
    }
    
    @IBAction func minusButton(_ sender: Any) {
        guard counterValue > 0 else {
            print ("Значение не может быть отрицательным!")
            minusButtonImage.addSymbolEffect(.disappear.down.byLayer)
            minusButtonImage.addSymbolEffect(.appear.up.byLayer)
            return
        }
        counterValue -= 1
        counterDisplay.text = String(counterValue)
        minusButtonImage.addSymbolEffect(.bounce.down.byLayer)
    }
    
    @IBAction func resetButton(_ sender: Any) {
        counterValue = 0
        counterDisplay.text = String(counterValue)
        resetButtonImage.addSymbolEffect(.bounce.down.byLayer)
    }
    
    
    
    
    override func viewDidLoad() {
        counterDisplay.text = "0"
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

