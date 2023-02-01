//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Константин Стольников on 2023/02/01.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    
    let quiz = [
        Quiz(q: "now is 6:82 AM", a: "False"),
        Quiz(q: "two plus four is equal six", a: "True"),
        Quiz(q: "you are not a robot", a: "True"),
        Quiz(q: "Your blood is green", a: "False"),
    ]
    
    var score          = 0
    var answerNumber   = 0
    var currentAnswer  = "False"
    
    mutating func resetVariables() {
        self.score = 0
        self.answerNumber = 0
        self.currentAnswer = "False"
    }

    func checkAnswer(_ userAnswer: String) -> Bool {
        return quiz[self.answerNumber].answer == userAnswer ? true : false
    }

}
