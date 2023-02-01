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
    
    let greenColor = UIColor.init(red: 101, green: 200, blue: 85, alpha: 0.0025)
    let redColor = UIColor.init(red: 200, green: 113, blue: 62, alpha: 0.0025)
    
    var buttons: [UIButton] = []
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttons += [trueButtonView, falseButtonView]
        setQuiz()
        buttons.forEach({ $0.layer.cornerRadius = 25 })
    }
    
    func setQuiz() {
        progressbarView.progress = Float((quizBrain.answerNumber + 1) * 100 / quizBrain.questions.count) / 100.0

        if quizBrain.answerNumber == quizBrain.questions.count {
            buttons.forEach({ $0.isHidden = true })
            questionLabelView.text = "Congratulations!\nYour score: \(quizBrain.score) / \(quizBrain.answerNumber) points."
            tryAgainViewButton.isHidden = false
            return
        }

        let tmp = quizBrain.questions[quizBrain.answerNumber]

        questionLabelView.text = tmp.question
        quizBrain.currentAnswer = tmp.answer
        
        self.buttons.forEach({
            $0.backgroundColor = UIColor.clear
            $0.isEnabled = true
        })
    }
    
    @IBAction func tryAgainPressed(_ sender: UIButton) {
        sender.isHidden = true
        sender.backgroundColor = UIColor.clear
        buttons.forEach({ $0.isHidden = false })
        quizBrain.resetVariables()
        setQuiz()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        buttons.forEach({ $0.isEnabled = false })
        if quizBrain.checkAnswer(sender.currentTitle!) {
            quizBrain.score += 1
            sender.backgroundColor = greenColor
        } else {
            sender.backgroundColor = redColor
        }

        quizBrain.answerNumber += 1
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { _ in self.setQuiz() }
    }


}
