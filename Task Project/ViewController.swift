//
//  ViewController.swift
//  Task Project
//
//  Created by apple on 18/12/18.
//  Copyright © 2018 Myteam11. All rights reserved.
//

import UIKit
// testing
class ViewController: UIViewController {

    let str_url: String = "http://m1.myteam11.in/APIPlayers/fortesting"
    let str_token: String = "sdfgdhfghjhdf6g4sd5g6fdhgf"
    var arr_batsman = [Dictionary<String, Any>]()
    var arr_bowler = [Dictionary<String, Any>]()
    var arr_allRounder = [Dictionary<String, Any>]()
    var arr_WK = [Dictionary<String, Any>]()
    
    @IBOutlet weak var lbl_eventName: UILabel!
    @IBOutlet weak var view_teamName: UIView!
    @IBOutlet weak var lbl_teamName: UILabel!
    @IBOutlet weak var lbl_timer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.getTeamData()
        

    }

    @IBAction func btn_toast(_ sender: Any)
    {
        
        self.view.show(message: "This is a test task for myteam11", controller: self, color: UIColor.red, time: 5.0)
        
    }

    func getTeamData() -> Void {
        
        let request = NSMutableURLRequest(url: NSURL(string: str_url)! as URL)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(str_token, forHTTPHeaderField: "Token")
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            // Check for error
            if error != nil
            {
                print("error=\(String(describing: error))")
                return
            }
            
            // Print out response string
//            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
//            print("responseString = \(String(describing: responseString))")
            
            // Convert server json response to NSDictionary
            do {
                if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as? NSDictionary {
                    
                    // Print out dictionary
                    print(convertedJsonIntoDict)
                    
                    // Get value by key
                    self.arr_WK = convertedJsonIntoDict["WC"] as! [Dictionary<String, Any>]
                    self.arr_batsman = convertedJsonIntoDict["BST"] as! [Dictionary<String, Any>]
                    self.arr_bowler = convertedJsonIntoDict["BOL"] as! [Dictionary<String, Any>]
                    self.arr_allRounder = convertedJsonIntoDict["ALL"] as! [Dictionary<String, Any>]
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            
        }
        
        task.resume()
    }
}

