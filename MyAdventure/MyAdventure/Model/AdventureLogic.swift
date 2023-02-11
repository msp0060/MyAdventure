//
//  AdventureLogic.swift
//  MyAdventure
//
//  Created by Shane Peek on 2/11/23.
//

import Foundation

struct AdventureLogic {
    var questionIndex : Int = 0
    var score: Int = 0
    var path: Int = 0
    
    let question = [
        Question("A dragon has kidnapped the princess! How will you attempt to save her?",
                 "Take the army from the castle with you",
                 "Take a small band with you",
                 "Go Alone",
                 "Go Alone"),
        Question("Which Direction must you take to locate the dragon?",
                 "Go North",
                 "Go South",
                 "Go East",
                 "Go East"),
        Question("How will you armor yourself to face the dragon?",
                 "Fully armored",
                 "Light armor",
                 "Light armor for yourself, but full armor for army",
                 "Fully armored"),
        Question("Will you fight the dragon now or will you run?",
                 "Fight",
                 "Run",
                 "Hide in the cave",
                 "Fight"),
        Question("How will you attempt to kill the dragon?",
                 "Stab it in the heart",
                 "Attempt to cut off it's head",
                 "Set a trap and try to catch it alive",
                 "Stab it in the heart"),
        Question("Which Direction must you take to locate the dragon?",
                 "Go North",
                 "Go South",
                 "Go East",
                 "Go South"),
        Question("How will you armor yourself to face the dragon?",
                 "Fully armored",
                 "Light armor for yourself",
                 "Light armor for yourself and the band",
                 "Light armor for yourself and the band"),
        Question("Will you fight the dragon now or will you run?",
                 "Fight",
                 "Run",
                 "Hide in the cave",
                 "Fight"),
        Question("How will you attempt to kill the dragon?",
                 "Stab it in the heart",
                 "Attempt to cut off it's head",
                 "Set a trap and try to catch it alive",
                 "Stab it in the heart"),
        Question("Which Direction must you take to locate the dragon?",
                 "Go North",
                 "Go South",
                 "Go East",
                 "Go North"),
        Question("How will you armor yourself to face the dragon?",
                 "Fully armored",
                 "Light armor",
                 "Light armor for yourself, but full armor for army",
                 "Light armor"),
        Question("Will you fight the dragon now or will you run?",
                 "Fight",
                 "Run",
                 "Hide in the cave",
                 "Fight"),
        Question("How will you attempt to kill the dragon?",
                 "Stab it in the heart",
                 "Attempt to cut off it's head",
                 "Set a trap and try to catch it alive",
                 "Attempt to cut off it's head"),
    ]
    
    mutating func compareUserAnswer(_ response: String) -> Bool {
        if response == question[questionIndex].answer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    mutating func increaseIndex() {
        if ((score < 4) && (questionIndex < question.count - 1)) {
            questionIndex += 1
        } else {
            questionIndex = 0
            score = 0
            path = 0
        }
    }
    
    func getNextQuestion() -> String {
        return question[questionIndex].question
    }
    
    func getChoiceOne() -> String {
        return question[questionIndex].option_one
    }
    
    func getChoiceTwo() -> String {
        return question[questionIndex].option_two
    }
    
    func getChoiceThree() -> String {
        return question[questionIndex].option_three
    }
    
    func getImageName() -> Int {
        return questionIndex + 1
    }
    
    func getQuestionIndex() -> Int {
        return questionIndex
    }
    
    mutating func setQuestionIndex(sentQuestionIndex: Int) {
        questionIndex = sentQuestionIndex
    }
    
    mutating func setScore(sentScore: Int) {
        score = sentScore
    }
    
    mutating func setPath(pathSent: Int) {
        path = pathSent
    }
    
    func getPath() -> Int {
        return path
    }
    
}
