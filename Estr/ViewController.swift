//
//  ViewController.swift
//  Estr
//
//  Created by auston salvana on 2015-11-07.
//  Copyright © 2015 ARJHack. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    //MARK: Helper functions 
    
    func setupView() {
        
        underlineTextField(emailField)
        underlineTextField(passwordField)
    }
    
    func getUsersName(userToken:String) {
        
        let URL = "http://engageapp.herokuapp.com/api/users/me"
        let headers = [
            "Authorization": "Bearer \(userToken)"
        ]
        
        Alamofire.request(.GET, URL, headers: headers)
            .responseJSON { response in
                print("the resposne from getName: \(response)")
        }
    }
    
    func loginUser(email:String, password:String, completionHandler: ((token:String) -> Void)) {
        
        let URL = "http://engageapp.herokuapp.com/auth/local"
        let json: [String: AnyObject] =
        [
            "email":email,
            "password":password
        ]
        
        Alamofire.request(.POST, URL, parameters: json, encoding: .JSON)
            .responseJSON {
                response in
                response
                
                let json = response.result.value as! NSDictionary
                let token = json["token"] as? String
                print("the token: \(token!)")
                completionHandler(token: token!)
                print("the status code \(response.response!.statusCode)")
        }
    }
    
    //MARK:IBActions
    
    @IBAction func login(sender: AnyObject) {
        
        let email = emailField.text!
        let password = passwordField.text!
        
        loginUser(email, password: password) { (token) -> Void in
            self.getUsersName(token)
        }
    }
    
}

