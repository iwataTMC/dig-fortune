//
//  ViewController.swift
//  fortune
//
//  Created by kai on 2021/11/29.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        answerLabel.text = "Today is ...??"
        answerImageView.image = UIImage(named: "omikuji")
    }

    @IBOutlet weak var answerImageView: UIImageView!
    
    
    
    @IBOutlet weak var answerLabel: UILabel!
    
    
    var answerNumber = 0
    
    @IBAction func shuffleAction(_ sender: Any) {


        // 0から7未満
        answerNumber = Int.random(in: 0..<7)
        
        if answerNumber == 0 {
            answerLabel.text = "大凶..."
            answerImageView.image = UIImage(named: "omikuji-daikyo")
        } else if answerNumber == 1 {
            answerLabel.text = "大吉！！！！"
            answerImageView.image = UIImage(named: "omikuji-daikichi")
        } else if answerNumber == 2 {
            answerLabel.text = "凶...！"
            answerImageView.image = UIImage(named: "omikuji-kyo")
        } else if answerNumber == 3 {
            answerLabel.text = "中吉...！"
            answerImageView.image = UIImage(named: "omikuji-chukichi")
        } else if answerNumber == 4 {
            answerLabel.text = "半凶...！"
            answerImageView.image = UIImage(named: "omikuji-hankyo")
        } else if answerNumber == 5 {
            answerLabel.text = "小凶...！"
            answerImageView.image = UIImage(named: "omikuji-shokyo")
        } else if answerNumber == 6 {
            answerLabel.text = "末凶...！"
            answerImageView.image = UIImage(named: "omikuji-suekyo")
        }
        
        
        
    }
    
    
    @IBAction func homeButton(_ sender: Any) {
        answerLabel.text = "Today is ...??"
        answerImageView.image = UIImage(named: "omikuji")
    }
    
    
}

