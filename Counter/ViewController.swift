//
//  ViewController.swift
//  Counter
//
//  Created by Наталья Черномырдина on 04.01.2025.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    private var counter: Int = 0 // значение переменной можно задать через сториборд
    
    private func getDate() -> String { 
        let date = Date.now
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let formatDate = dateFormatter.string(from: date)
        
        return formatDate
    }
    
    lazy var formattedDate = getDate() // "ленивое" свойство для получения текущей даты и времени
    
    @IBOutlet weak var clickPlusButton: UIButton!
    @IBOutlet weak var clickMinusButton: UIButton!
    @IBOutlet weak var clickResetButton: UIButton!
    @IBOutlet weak var changesTextView: UITextView!
    @IBOutlet weak var counterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = String(counter)
        changesTextView.text = "История изменений: \n"
    }
    
    @IBAction func clickPlusButton(_ sender: Any) {
        counter += 1
        counterLabel.text = "Значение счётчика: \(counter)"
        changesTextView.text += "\(getDate()) значение изменено на +1\n"
    }
    @IBAction func clickMinusButton(_ sender: Any) {
        if counter > 0 {
           counter -= 1
           counterLabel.text = "Значение счётчика: \(counter)"
           changesTextView.text += "\(getDate()) значение изменено на -1\n"
            } else {changesTextView.text += "\(getDate()) попытка уменьшить значение счётчика ниже 0\n"}
    }
    
    @IBAction func clickResetButton(_ sender: Any) {
        counter = 0
        counterLabel.text = String(counter)
        changesTextView.text += "\(getDate()): значение сброшено\n"
    }
}





