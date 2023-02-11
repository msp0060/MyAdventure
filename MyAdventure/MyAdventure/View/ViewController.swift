//
//  ViewController.swift
//  MyAdventure
//
//  Created by Shane Peek on 2/9/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    @IBOutlet weak var middleButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var adventureLogic = AdventureLogic()
    var questionCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerSubmitted(_ sender: UIButton) {
        let answerSubmitted = sender.titleLabel!.text!
        
        if (adventureLogic.getQuestionIndex() == 0 && adventureLogic.getPath() == 0) {
            
            if (answerSubmitted == adventureLogic.getChoiceOne()) {
                adventureLogic.setPath(pathSent: 1)
                sender.backgroundColor = UIColor.green
            } else if (answerSubmitted == adventureLogic.getChoiceTwo()) {
                adventureLogic.setPath(pathSent: 2)
                sender.backgroundColor = UIColor.green
                adventureLogic.setQuestionIndex(sentQuestionIndex: 4)
            } else {
                adventureLogic.setPath(pathSent: 3)
                sender.backgroundColor = UIColor.green
                adventureLogic.setQuestionIndex(sentQuestionIndex: 8)
            }
        } else if (adventureLogic.getQuestionIndex() > 0 && adventureLogic.getPath() == 1) {
            let isCorrect = adventureLogic.compareUserAnswer(answerSubmitted)
            
            if isCorrect {
                sender.backgroundColor = UIColor.green
            } else {
                sender.backgroundColor = UIColor.red
                backgroundImage.image = UIImage(named: "loser")
                adventureLogic.setQuestionIndex(sentQuestionIndex: -1)
                adventureLogic.setScore(sentScore: 0)
                adventureLogic.setPath(pathSent: 0)
            }
        } else if (adventureLogic.getQuestionIndex() > 0 && adventureLogic.getPath() == 2) {
            let isCorrect = adventureLogic.compareUserAnswer(answerSubmitted)
            
            if isCorrect {
                sender.backgroundColor = UIColor.green
            } else {
                sender.backgroundColor = UIColor.red
                backgroundImage.image = UIImage(named: "loser")
                adventureLogic.setQuestionIndex(sentQuestionIndex: -1)
                adventureLogic.setScore(sentScore: 0)
                adventureLogic.setPath(pathSent: 0)
            }
        } else {
            let isCorrect = adventureLogic.compareUserAnswer(answerSubmitted)
            
            if isCorrect {
                sender.backgroundColor = UIColor.green
            } else {
                sender.backgroundColor = UIColor.red
                backgroundImage.image = UIImage(named: "loser")
                adventureLogic.setQuestionIndex(sentQuestionIndex: -1)
                adventureLogic.setScore(sentScore: 0)
                adventureLogic.setPath(pathSent: 0)
            }
                        
        }
        
        //backgroundImage.image = UIImage(named: "Winner")  I had an image flash if they won the adventure prior to refactoring
        // but could not determine how to do this after refactoring.
        
        adventureLogic.increaseIndex()
        Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = adventureLogic.getNextQuestion()
        backgroundImage.image = UIImage(named: String(adventureLogic.getImageName()))
        topButton.setTitle(adventureLogic.getChoiceOne(), for: .normal)
        bottomButton.setTitle(adventureLogic.getChoiceTwo(), for: .normal)
        middleButton.setTitle(adventureLogic.getChoiceThree(), for: .normal)
        topButton.backgroundColor = UIColor.clear
        bottomButton.backgroundColor = UIColor.clear
        middleButton.backgroundColor = UIColor.clear
    }
}

