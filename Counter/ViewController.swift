//
//  ViewController.swift
//  Counter
//
//  Created by Наталья Черномырдина on 04.01.2025.
//

import UIKit
import Foundation

final class ViewController: UIViewController {
    private var counter: Int = 0 // значение переменной можно задать через сториборд
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = String(counter)
        changesTextView.text = "История изменений: \n"
    }
        private func getDate() -> String { 
        let date = Date.now
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let formatDate = dateFormatter.string(from: date)
        
        return formatDate
    }
    
    lazy private var formattedDate = getDate() // "ленивое" свойство для получения текущей даты и времени

    @IBOutlet private weak var clickPlusButton: UIButton!
    @IBOutlet private weak var clickMinusButton: UIButton!
    @IBOutlet private weak var clickResetButton: UIButton!
    @IBOutlet private weak var changesTextView: UITextView!
    @IBOutlet private weak var counterLabel: UILabel!
    
    @IBAction private func clickPlusButton(_ sender: Any) {
        counter += 1
        counterLabel.text = "Значение счётчика: \(counter)"
        changesTextView.text += "\(getDate()) значение изменено на +1\n"
    }
    @IBAction private func clickMinusButton(_ sender: Any) {
        if counter > 0 {
           counter -= 1
           counterLabel.text = "Значение счётчика: \(counter)"
           changesTextView.text += "\(getDate()) значение изменено на -1\n"
            } else {changesTextView.text += "\(getDate()) попытка уменьшить значение счётчика ниже 0\n"}
    }    
    @IBAction private func clickResetButton(_ sender: Any) {
        counter = 0
        counterLabel.text = String(counter)
        changesTextView.text += "\(getDate()): значение сброшено\n"
    }
}





