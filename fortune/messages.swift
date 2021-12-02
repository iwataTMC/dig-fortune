import UIKit
import Foundation



struct Message: Codable {
    let id: Int
    let advice: String
}




struct ResultJson: Codable {
    let slip: Message
}

var resultMessage:String = ""

func get(){
    
    var messageNumber = 1
    
    messageNumber = Int.random(in: 1...100)
    print(messageNumber)
    
    let urlString = "https://api.adviceslip.com/advice/\(messageNumber)"

    guard let url = URL(string: urlString) else { return }
    print(url)
    
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
            print(resultMessage)
            
        }catch{
            print("error!!")
        }
    })
        
        task.resume()
    
    
}

get()

print(resultMessage)
