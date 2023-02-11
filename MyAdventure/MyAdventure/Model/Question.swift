//
//  Question.swift
//  MyAdventure
//
//  Created by Shane Peek on 2/11/23.
//

import Foundation

struct Question {
    
    init(_ ques: String, _ o_one: String, _ o_two: String, _ o_three: String,_ ans: String) {
        question = ques
        option_one = o_one
        option_two = o_two
        option_three = o_three
        answer = ans
    }
    var question: String
    var answer: String
    var option_one: String
    var option_two: String
    var option_three: String
}
