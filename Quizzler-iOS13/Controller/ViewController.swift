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

    override func viewDidLoad() {
        super.viewDidLoad()
        setQuiz()
        trueButtonView.layer.cornerRadius = 25
        falseButtonView.layer.cornerRadius = 25
    }
    
    var quizBrain = QuizBrain()
    
    func setQuiz() {
        progressbarView.progress = Float((quizBrain.answerNumber + 1) * 100 / quizBrain.quiz.count) / 100.0

        if quizBrain.answerNumber == quizBrain.quiz.count {
            trueButtonView.isHidden = true
            falseButtonView.isHidden = true
            questionLabelView.text = "Congratulations!\nYour score: \(quizBrain.score) / \(quizBrain.answerNumber) points."
            tryAgainViewButton.isHidden = false
            return
        }

        let tmp = quizBrain.quiz[quizBrain.answerNumber]

        self.questionLabelView.text = tmp.question
        quizBrain.currentAnswer = tmp.answer

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

        quizBrain.resetVariables()
        self.setQuiz()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        trueButtonView.isEnabled = false
        falseButtonView.isEnabled = false
        if sender.currentTitle! == quizBrain.currentAnswer {
            quizBrain.score += 1
            sender.backgroundColor = UIColor.init(red: 101, green: 200, blue: 85, alpha: 0.0025)
        } else {
            sender.backgroundColor = UIColor.init(red: 200, green: 113, blue: 62, alpha: 0.0025)
        }
        quizBrain.answerNumber += 1
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { _ in
            self.setQuiz()
        }
    }


}

