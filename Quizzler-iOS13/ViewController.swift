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
    @IBOutlet weak var tryAgainViewButton: UIButton!
    @IBOutlet weak var questionLabelView: UILabel!
    
    let quiz = [
        Quiz(q: "now is 6:82 AM", a: "False"),
        Quiz(q: "two plus four is equal six", a: "True"),
        Quiz(q: "you are not a robot", a: "True"),
        Quiz(q: "Your blood is green", a: "False"),
    ]
    
    var currentScore = 0
    var attemptCount = 0
    var maxAttempt = 0
    
    var currentAnswer = "False"
    
    func resetVariables() {
        self.currentScore = 0
        self.attemptCount = 0
        self.maxAttempt = 0
        self.currentAnswer = "False"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setQuiz()
        trueButtonView.layer.cornerRadius = 25
        falseButtonView.layer.cornerRadius = 25
    }
    
    func setQuiz() {
        progressbarView.progress = Float((attemptCount + 1) * 100 / quiz.count) / 100.0

        if attemptCount == quiz.count {
            trueButtonView.isHidden = true
            falseButtonView.isHidden = true
            questionLabelView.text = "Congratulations!\nYour score: \(self.currentScore) / \(self.attemptCount) points."
            tryAgainViewButton.isHidden = false
            return
        }

        let tmp = quiz[self.attemptCount]

        self.questionLabelView.text = tmp.question
        self.currentAnswer = tmp.answer

        trueButtonView.backgroundColor = UIColor.clear
        trueButtonView.isEnabled = true
        
        falseButtonView.backgroundColor = UIColor.clear
        falseButtonView.isEnabled = true
    }
    
    @IBAction func tryAgainPressed(_ sender: UIButton) {
        sender.isHidden = true
        sender.backgroundColor = UIColor.clear
        trueButtonView.isHidden = false
        falseButtonView.isHidden = false

        self.resetVariables()
        self.setQuiz()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        trueButtonView.isEnabled = false
        falseButtonView.isEnabled = false
        if sender.currentTitle! == self.currentAnswer {
            currentScore += 1
            sender.backgroundColor = UIColor.init(red: 101, green: 200, blue: 85, alpha: 0.0025)
        } else {
            sender.backgroundColor = UIColor.init(red: 200, green: 113, blue: 62, alpha: 0.0025)
        }
        attemptCount += 1
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { _ in
            self.setQuiz()
        }
    }


}

