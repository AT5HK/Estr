//
//  RegisterViewController.swift
//  Estr
//
//  Created by auston salvana on 2016-02-06.
//  Copyright © 2016 ARJHack. All rights reserved.
//

import UIKit
import Alamofire

class RegisterViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    //MARK: Helper functions
    
    func setupView() {
        
        underlineTextField(nameField)
        underlineTextField(passwordField)
        underlineTextField(confirmPasswordField)
        underlineTextField(emailField)
    }
    
    func registerUser(name:String, password:String, email:String) {
        
        let URL = "http://engageapp.herokuapp.com/api/users"
        let json: [String: AnyObject] =
        [
            "name":name,
            "email":email,
            "password":password
        ]
        
        Alamofire.request(.POST, URL, parameters: json, encoding: .JSON)
            .responseJSON {
                response in
                print("the status code \(response.response?.statusCode)")
                print("the registration repsone: \(response)")
        }
    }
    
    //MARK: IBActions
    
    @IBAction func register(sender: AnyObject) {
        
        let name = nameField.text!
        let password = passwordField.text!
        let email = emailField.text!
        
        registerUser(name, password: password, email: email)
    }
    
    
}
