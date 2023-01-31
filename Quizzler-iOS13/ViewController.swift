//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressbarView: UIProgressView!
    @IBOutlet weak var falseButtonView: UIButton!
    @IBOutlet weak var trueButtonView: UIButton!
    @IBOutlet weak var questionLabelView: UILabel!
    
    let quiz = [
        Quiz(q: "now is 6:82 AM", a: "False"),
        Quiz(q: "two plus four is equal six", a: "True"),
        Quiz(q: "you are not a robot", a: "True"),
    ]
    
    var currentScore = 0
    var attemptCount = 0
    var maxAttempt = 0
    
    var currentAnswer = "False"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setQuiz()
    }
    
    func setQuiz() {
        progressbarView.progress = Float(attemptCount * 100 / quiz.count) / 100.0
        if attemptCount == quiz.count {
            trueButtonView.isHidden = true
            falseButtonView.isHidden = true
            progressbarView.isHidden = true
            
            questionLabelView.text = "Congratulations!\nYour score: \(self.currentScore) / \(self.attemptCount) points."
            return
        }
        let tmp = quiz[self.attemptCount]
        questionLabelView.text = tmp.question
        self.currentAnswer = tmp.answer
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        if sender.currentTitle! == self.currentAnswer {
            currentScore += 1
        }
        attemptCount += 1
        setQuiz()
    }


}

