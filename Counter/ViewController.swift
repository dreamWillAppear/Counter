//
//  ViewController.swift
//  Counter
//
//  Created by dreamlogin on 19.10.2023.
//

import UIKit
var counterValue  = 0
let dateFormatter = DateFormatter()
let date = Date()

class ViewController: UIViewController {
    @IBOutlet weak var plusButtonImage: UIImageView!
    @IBOutlet weak var minusButtonImage: UIImageView!
    @IBOutlet weak var resetButtonImage: UIImageView!
    @IBOutlet weak var counterDisplay: UILabel!
    @IBOutlet weak var changeHistory: UITextView!
    
    @IBAction func plusButton(_ sender: Any) {
        counterValue += 1
        counterDisplay.text = String(counterValue)
        plusButtonImage.addSymbolEffect(.bounce.down.byLayer)
        changeHistory.text.append("+1!\n")
    }
    
    @IBAction func minusButton(_ sender: Any) {
        guard counterValue > 0 else { //"Защищаемся" от отрицательного счетчика
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
        changeHistory.insertText("\(date): значение сброшено»\n")
        resetButtonImage.addSymbolEffect(.bounce.down.byLayer)
    }
    
    
    
    
    override func viewDidLoad() {
        changeHistory.isEditable = false //отключение возможности редактирования (ТЗ п.6)
        changeHistory.text = "История изменений:\n"
        counterDisplay.text = "0"
        dateFormatter.dateFormat  = "dd-MM-yyyy'T'HH:mm:ss"
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

