//
//  quiz.swift
//  Quizzler-iOS13
//
//  Created by Константин Стольников on 2023/01/31.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct Quiz {
    let question : String
    let answer   : String
    let price    : Int
    
    init(q: String, a: String, price: Int = 1) {
        self.question = q
        self.answer = a
        self.price = price
    }
}
