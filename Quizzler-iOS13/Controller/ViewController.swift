//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    //QuizBrain(構造体)をインスタンス化
   var quizBrain = QuizBrain()
    
    
    
    //アプリが立ち上がって最初の1度だけしか表示されないメソッドなのでこの中に直接配列を入れても最初の1問目から次に進まない為、外にメソッドを作って呼び出す
    override func viewDidLoad() {
        super.viewDidLoad()
        //updateUIメソッドを呼ぶ
        updateUI()
    }
    
    //trueボタンとfalseボタン
    //senderにタップしたボタンの情報が入る
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        //ユーザーがタップしたボタンをuserAnswerとする(true or falseが入る)
        let userAnswer = sender.currentTitle!
        
        //quizBrainのcheckAnswer(userAnswer)をuserGotItRightとしてインスタンス化
        //quizBrainのcheckAnswerは回答チェックするメソッド。userAnswerにはユーザーがタップしたボタンの情報が入っている
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        //ユーザーがタップしたボタンが正しかったら
        if userGotItRight {
            //タップしたボタンのbackgroundColorを緑表示
            sender.backgroundColor = UIColor.green
            //そうでなかったら(等しくなかったら)
        } else {
            //タップしたボタンのbackgroundColorを赤表示
            sender.backgroundColor = UIColor.red
        }
        //正解、不正解にかかわらず次の問題へ
        //quizBrainのnextQuestionメソッドを呼ぶ
        quizBrain.nextQuestion()
        
        //updateUIを0.2秒遅らせて実行させる(遅らせないと速すぎてbackgroundColorが表示されない)
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    //クイズを表示するメソッド
    @objc func updateUI() {
        //getQuestionTextメソッドで取得した問題をlabえるに表示
        questionLabel.text = quizBrain.getQuestionText()
        //getProgressメソッドで計算した値をprogressに反映
        progressBar.progress = quizBrain.getProgress()
       
        //quizBrainのgetScoreのメソッドをscoreLabelのtextのに反映
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        //backgroundColorが残ったままになるので消す
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
       
    }
}
