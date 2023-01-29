//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class iQuiz {
    let question : String
    let answer   : Bool
    let price    : Int
    
    init(question: String, answer: Bool, price: Int = 1) {
        self.question = question
        self.answer = answer
        self.price = price
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var progressbarView: UIProgressView!
    @IBOutlet weak var falseButtonView: UIButton!
    @IBOutlet weak var trueButtonView: UIButton!
    @IBOutlet weak var questionLabelView: UILabel!
    
    let quiz = [
        iQuiz(question: "now is 6:82 AM", answer: false),
        iQuiz(question: "two plus four is equal six", answer: true),
        iQuiz(question: "you are not a robot", answer: true),
    ]
    
    var currentScore = 0
    var attemptCount = 0
    var maxAttempt = 0
    
    var currentAnswer = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        maxAttempt = quiz.count
        setQuiz()
    }
    
    func setQuiz() {
        progressbarView.progress = Float(attemptCount * 100 / maxAttempt) / 100.0
//        TODO:
        /*
         TODO: надо бы сделать
            1) structure вместо class
            2) maxAttempt убрать
            3) sender.currentTitle! == "True" - может проще результат сразу хранить в строке?
            4) Структуру вопросов в отдельный файл (гуд практис)
         */
        if attemptCount == maxAttempt {
            trueButtonView.isHidden = true
            falseButtonView.isHidden = true
            progressbarView.isHidden = true
            
            questionLabelView.text = "Congratulations!\nYour score: \(self.currentScore)"
            return
        }
        let tmp = quiz[self.attemptCount]
        questionLabelView.text = tmp.question
        self.currentAnswer = tmp.answer
    }
    
    func checkAnswer(answer: Bool) -> Bool {
        if self.currentAnswer == answer {
            return true
        }
        return false
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        if checkAnswer(answer: sender.currentTitle! == "True") {
            currentScore += 1
        }
        attemptCount += 1
        setQuiz()
    }


}

