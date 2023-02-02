//
//  quiz.swift
//  Quizzler-iOS13
//
//  Created by Константин Стольников on 2023/01/31.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let question      : String
    let answer        : [String]
    let correctAnswer : String
    
    init(q: String, correctAnswer: String, a: [String] = ["True", "False"]) {
        self.question = q
        self.answer = a
        self.correctAnswer = correctAnswer
    }
}
