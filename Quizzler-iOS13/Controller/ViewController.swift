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
    @IBOutlet weak var tryAgainViewButton: UIButton!
    @IBOutlet weak var questionLabelView: UILabel!
    
    @IBOutlet weak var firstButtonView: UIButton!
    @IBOutlet weak var secondButtonView: UIButton!
    @IBOutlet weak var thirdButtonView: UIButton!

    let greenColor = UIColor.init(red: 101, green: 200, blue: 85, alpha: 0.0025)
    let redColor = UIColor.init(red: 200, green: 113, blue: 62, alpha: 0.0025)
    
    var buttons: [UIButton] = []
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttons += [firstButtonView, secondButtonView, thirdButtonView]
        setQuiz()
        buttons.forEach({ $0.layer.cornerRadius = 25 })
    }
    
    @IBAction func tryAgainPressed(_ sender: UIButton) {
        sender.isHidden = true
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

    func setQuiz() {
        progressbarView.progress = quizBrain.getProgress()

        if quizBrain.answerNumber == quizBrain.questions.count {
            quizComplete()
            return
        }
        nextQuestion()
    }
    
    func nextQuestion() {
        let question = quizBrain.getQuestion()
        questionLabelView.text = question.question
        quizBrain.currentAnswer = question.correctAnswer

        self.buttons.forEach({
            $0.isHidden = true
        })

        for (index, q) in question.answer.enumerated() {
            buttons[index].setTitle(q, for: .normal)
            buttons[index].backgroundColor = UIColor.clear
            buttons[index].isEnabled = true
            buttons[index].isHidden = false
        }
    }
    
    func quizComplete() {
        buttons.forEach({ $0.isHidden = true })
        questionLabelView.text = "Congratulations!\n"
        + "Your score: \(quizBrain.score) / \(quizBrain.answerNumber) points."

        tryAgainViewButton.isHidden = false
    }
}
