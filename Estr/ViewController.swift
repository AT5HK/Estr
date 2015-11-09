//
//  ViewController.swift
//  Estr
//
//  Created by auston salvana on 2015-11-07.
//  Copyright © 2015 ARJHack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        underlineTextField(usernameField)
        underlineTextField(passwordField)
    }
    
    //MARK: Helper functions 
    
    func underlineTextField(textField:UITextField) {
        let border = CALayer()
        let width = CGFloat(0.5)
        border.borderColor = UIColor(white: 1.0, alpha: 0.7).CGColor
        border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width:  textField.frame.size.width, height: textField.frame.size.height)
        
        border.borderWidth = width
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true
    }

}

