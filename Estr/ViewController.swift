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
    
    func loginUser(email:String, password:String) {
        
        let URL = "http://engageapp.herokuapp.com/auth/local"
        let json: [String: AnyObject] =
        [
            "email":email,
            "password":password
        ]
        
        Alamofire.request(.POST, URL, parameters: json, encoding: .JSON)
            .responseJSON {
                response in
                print("the status code \(response.response?.statusCode)")
                print("the login repsone: \(response)")
        }
    }
    
    //MARK:IBActions
    
    @IBAction func login(sender: AnyObject) {
        
        let email = emailField.text!
        let password = passwordField.text!
        
        loginUser(email, password: password)
    }
}

