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
    
    
    
    
    @IBAction func shuffleAction(_ sender: Any) {
    }
    
    
    
    
}

