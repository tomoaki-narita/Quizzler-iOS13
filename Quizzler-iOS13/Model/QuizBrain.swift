//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by output. on 2020/06/15.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    //Question.swiftファイルを作成してstruct(構造体)書いておく
    //配列に入れる
    let quiz = [
        Question(q: "A slug's blood is green.", a: "True"),
        Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        Question(q: "Google was originally called 'Backrub'.", a: "True"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]
    
    //配列の番号として使う変数
    var questionNumber = 0
    
    //スコアラベルに表示するスコアの変数(0からスタートさせる)
    var score = 0
    
    //ユーザーの回答と本当の回答をチェックするメソッド
    //メソッド内のプロパティを変更・更新する場合はfuncの前にmutatingをつける
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        //もしuserAnswerとquiz配列のクイズ番号の答えが等しかったら
        if userAnswer == quiz[questionNumber].answer {
            
            //scoreをインクリメント
            score += 1
            
            //trueを返す
            return true
            //等しくなかったら
        } else {
            //falseを返す
            return false
        }
    }
    
    //scoreに入っている値を返すメソッド
    func getScore() -> Int {
        return score
    }
    
    //quiz配列のquestionNumber番目のtext(問題)を返すメソッド
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    //プログレスバーを進捗度合いを設定(計算)するメソッド
    func getProgress() -> Float {
        //questionNumber番目 ÷ quiz配列のcount(数)
        //結果が小数点になる為Float型に変換
        //最後のクイズまで行ってもprogressBarが最後まで届かず1問目に戻ってリセットされてしまうので+1しておく
        //1問目は配列の0番目になるので"0 ÷ quiz.count"は0になることが理由
        let progress = Float(questionNumber + 1) / Float(quiz.count)
        //progressを返す
        return progress
    }
   
    //問題を次に進めるメソッド
    //struct(構造体)とenum(列挙体)の場合、メソッド経由でプロパティを変更・更新する場合はfuncの前にmutatingをつける
    mutating func nextQuestion() {
        //questionNumberに+1することでquizのcountと同じ数になる
        //quizは問題の数分で止まるが、questionNumberはインクリメントして増え続けるので
        //quizのcountより大きくなったら0に戻す
        if questionNumber + 1 < quiz.count {
            //インクリメント(次の問題に進む)
            questionNumber += 1
            //クイズの数を超えたら0に戻してスコアも0に戻す
        } else {
            questionNumber = 0
            score = 0
        }
    }
}
