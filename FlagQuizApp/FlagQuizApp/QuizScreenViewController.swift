//
//  QuizScreenViewController.swift
//  FlagQuizApp
//
//  Created by Yusuf Can Bircan on 23.11.2022.
//

import UIKit

class QuizScreenViewController: UIViewController {
    
    @IBOutlet weak var trueLabel: UILabel!
    @IBOutlet weak var falseLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var button1Label: UIButton!
    @IBOutlet weak var button2Label: UIButton!
    @IBOutlet weak var button3LAbel: UIButton!
    @IBOutlet weak var button4Label: UIButton!
    
    //// Declaring necessary variables
    var questionCounter: Int = 0
    var falseQuestionCounter: Int = 0
    var trueQuestionCounter: Int = 0
    
    var trueQuestion: Flag = Flag()
    var falseQuestions: [Flag] = [Flag]()
    
    var questions:[Flag] = [Flag]()
    
    var questionsSet = Set <Flag>()
    var mixedQuestions = [Flag]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //// Hiding Back button
        navigationItem.hidesBackButton = true
        //// Fetch Questions
        questions = FlagDao().fetch5RandomQuestion()
        
        loadQuestion()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ResultScreenViewController
        
        destinationVC.trueResult = trueQuestionCounter
    }
    
    func loadQuestion() {
        trueLabel.text = "True: \(trueQuestionCounter)"
        falseLabel.text = "False: \(falseQuestionCounter)"
        
        questionLabel.text = "\(questionCounter+1). Question"
        
        trueQuestion = questions[questionCounter]
        flagImageView.image = UIImage(named: trueQuestion.bayrak_resim!)
        
        falseQuestions = FlagDao().fetch3RandomFlag(bayrak_id: trueQuestion.bayrak_id!)
        
        //// Mix the questions
        questionsSet.removeAll()
        questionsSet.insert(trueQuestion)
        for i in falseQuestions {
            questionsSet.insert(i)
        }
        
        mixedQuestions.removeAll()
        for i in questionsSet {
            mixedQuestions.append(i)
        }
        
        //// Set the buttons names
        button1Label.setTitle(mixedQuestions[0].bayrak_ad, for: .normal)
        button2Label.setTitle(mixedQuestions[1].bayrak_ad, for: .normal)
        button3LAbel.setTitle(mixedQuestions[2].bayrak_ad, for: .normal)
        button4Label.setTitle(mixedQuestions[3].bayrak_ad, for: .normal)
        
    }
    
    func answerControl(button: UIButton) {
        let tappedButton = button.titleLabel?.text
        let trueAnswer = trueQuestion.bayrak_ad
        
        if tappedButton == trueAnswer {
            trueQuestionCounter += 1
        } else {
            falseQuestionCounter += 1
        }
        
        trueLabel.text = "True: \(trueQuestionCounter)"
        falseLabel.text = "False: \(falseQuestionCounter)"
    }
    
    func endControl() {
        questionCounter += 1
        
        if questionCounter == 5 {
            performSegue(withIdentifier: "toResultScreen", sender: nil)
        } else {
            loadQuestion()
        }
    }
    
    
    
    @IBAction func button1(_ sender: Any) {
        answerControl(button: button1Label)
        endControl()
    }
    
    @IBAction func button2(_ sender: Any) {
        answerControl(button: button2Label)
        endControl()
    }
    
    @IBAction func button3(_ sender: Any) {
        answerControl(button: button3LAbel)
        endControl()
    }
    
    @IBAction func button4(_ sender: Any) {
        answerControl(button: button4Label)
        endControl()
    }
}
