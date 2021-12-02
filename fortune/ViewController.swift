//
//  ViewController.swift
//  fortune
//
//  Created by kai on 2021/11/29.
//

import UIKit
import Foundation

class ViewController: UIViewController {


    
    @IBOutlet weak var answerImageView: UIImageView!
    
    var animator: UIViewPropertyAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        answerLabel.text = "Today is ...??"
        answerImageView.image = UIImage(named: "omikuji")
        
        
        
        animator = UIViewPropertyAnimator(duration:1.0,curve: .easeInOut){
            self.answerImageView.center.y += 500
            self.answerImageView.center.x += 500
        }

        animator.startAnimation()
        
        
        
        
    }

   
    
    
    
    @IBOutlet weak var answerLabel: UILabel!
    
    

    
    @IBAction func shuffleAction(_ sender: Any) {
        
        
        
        //
        
        struct Message: Codable {
            let id: Int
            let advice: String
        }

        struct ResultJson: Codable {
            let slip: Message
        }
        
        var resultMessage:String = ""
        
        func wait(_ waitContinuation: @escaping (()->Bool), compleation: @escaping (()->Void)) {
            var wait = waitContinuation()
            // 0.01秒周期で待機条件をクリアするまで待ちます。
            let semaphore = DispatchSemaphore(value: 0)
            DispatchQueue.global().async {
                while wait {
                    DispatchQueue.main.async {
                        wait = waitContinuation()
                        semaphore.signal()
                    }
                    semaphore.wait()
                    Thread.sleep(forTimeInterval: 0.01)
                }
                // 待機条件をクリアしたので通過後の処理を行います。
                DispatchQueue.main.async {
                    compleation()
                }
            }
        }


        //var imgData: NSData! = nil
        DispatchQueue.global().async {
            var messageNumber = 1

            messageNumber = Int.random(in: 1...100)
        //    print(messageNumber)

            let urlString = "https://api.adviceslip.com/advice/\(messageNumber)"
            

            guard let url = URL(string: urlString) else { return }
        //    print(url)

            let req = URLRequest(url: url)

            let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)



            // HTTPメソッドを実行
            let task = session.dataTask(with: req, completionHandler: {
                (data,response,error) in

                session.finishTasksAndInvalidate()

                do {
                    let decoder = JSONDecoder()

                    let json = try decoder.decode(ResultJson.self, from: data!)
                    resultMessage = json.slip.advice as String
        //            print("message:"+resultMessage)

                }catch{
                    print("error!!")
                }
            })

                task.resume()
        }
        // dataを取得するまで待ちます
        wait( { return resultMessage == "" } ) {
            
            // 0から7未満
            var answerNumber = 0
            answerNumber = Int.random(in: 0..<7)

            if answerNumber == 0 {
                self.answerLabel.text = resultMessage
                self.answerImageView.image = UIImage(named: "omikuji-daikyo")
            } else if answerNumber == 1 {
                self.answerLabel.text = resultMessage
                self.answerImageView.image = UIImage(named: "omikuji-daikichi")
            } else if answerNumber == 2 {
                self.answerLabel.text = resultMessage
                self.answerImageView.image = UIImage(named: "omikuji-kyo")
            } else if answerNumber == 3 {
                self.answerLabel.text = resultMessage
                self.answerImageView.image = UIImage(named: "omikuji-chukichi")
            } else if answerNumber == 4 {
                self.answerLabel.text = resultMessage
                self.answerImageView.image = UIImage(named: "omikuji-hankyo")
            } else if answerNumber == 5 {
                self.answerLabel.text = resultMessage
                self.answerImageView.image = UIImage(named: "omikuji-shokyo")
            } else if answerNumber == 6 {
                self.answerLabel.text = resultMessage
                self.answerImageView.image = UIImage(named: "omikuji-suekyo")
            }
            // 取得しました
//            print("finish")
            print("result:"+resultMessage)
        }



        //
        

        
        
        
    }
    
    
    @IBAction func homeButton(_ sender: Any) {
        answerLabel.text = "Today is ...??"
        answerImageView.image = UIImage(named: "omikuji")
        
        animator = UIViewPropertyAnimator(duration:1.0,curve: .easeInOut){
            self.answerImageView.center.y += 500
            self.answerImageView.center.x += 500
        }

        animator.startAnimation()
    }
    
    
}

