//
//  ViewController.swift
//  Counter
//
//  Created by dreamlogin on 19.10.2023.
//

import UIKit
var counterValue = 0
var currentDate = Date()
var dateFormat = DateFormatter()
var date: String { dateFormat.string(from: currentDate) }

extension UITextView {
    func scrollToBottom() { //нагуглил функцию автопрокрутки вниз, пока что плохо понимаю что тут происходит, но завернул в extension
        if self.text.count > 0 {
            let location = self.text.count - 1
            let bottom = NSMakeRange(location, 1)
            self.scrollRangeToVisible(bottom)
        }
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var plusButtonImage: UIImageView! //image кнопки - объеденил в отдельную View конпку и картинку, пока не знаю как это делается грамотно
    @IBOutlet weak var minusButtonImage: UIImageView!
    @IBOutlet weak var resetButtonImage: UIImageView!
    @IBOutlet weak var counterDisplay: UILabel!
    @IBOutlet weak var changeHistory: UITextView!
    
    
    
    @IBAction func plusButton(_ sender: Any) {
        
        counterValue += 1 //изменение счетчика
        currentDate = Date() //записываем дату события
        counterDisplay.text = String(counterValue) //изменение лейбла, отображающего значение счетчика
        changeHistory.insertText("\(date): значение изменено на +1\n"); changeHistory.scrollToBottom()//добавление лога в историю изменений
        plusButtonImage.addSymbolEffect(.bounce.down.byLayer) //анимация кнопки
    }
    
    @IBAction func minusButton(_ sender: Any) {
        guard counterValue > 0 else { //"защищаемся" от отрицательного счетчика
            currentDate = Date()
            changeHistory.insertText("\(date): попытка уменьшить значение счётчика ниже 0\n"); changeHistory.scrollToBottom()
            minusButtonImage.addSymbolEffect(.disappear.down.byLayer) //кнопка исчезает
            minusButtonImage.addSymbolEffect(.appear.up.byLayer) //кнопка появляется - это ок или кустарно?
            return
        }
        counterValue -= 1
        currentDate = Date()
        counterDisplay.text = String(counterValue)
        changeHistory.insertText("\(date): значение изменено на -1\n"); changeHistory.scrollToBottom()
        minusButtonImage.addSymbolEffect(.bounce.down.byLayer)
    }
    
    @IBAction func resetButton(_ sender: Any) {
        counterValue = 0
        currentDate = Date()
        counterDisplay.text = String(counterValue)
        changeHistory.insertText("\(date): значение сброшено\n"); changeHistory.scrollToBottom()
        resetButtonImage.addSymbolEffect(.bounce.down.byLayer)
    }
   
    
    
    override func viewDidLoad() {
    
        changeHistory.isEditable = false //отключение возможности редактирования
        changeHistory.text = "История изменений:\n" //дефолтный начальный текст окна лога
        counterDisplay.text = "0" //дефолтный текст лейбла счетчика
        dateFormat.dateFormat = "dd.MM.yyyy HH:mm:ss"//формат отображения даты для лога
        
        super.viewDidLoad()
        // Do any additional setup after loading the view. - есть традиция оставлять этот коммент?
    }
    
}

