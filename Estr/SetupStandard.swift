//
//  SetupStandard.swift
//  Estr
//
//  Created by auston salvana on 2016-02-06.
//  Copyright © 2016 ARJHack. All rights reserved.
//

import UIKit
import Foundation

class SetupStandard: NSObject {

}

func underlineTextField(textField:UITextField) {
    let border = CALayer()
    let width = CGFloat(0.5)
    border.borderColor = UIColor(white: 1.0, alpha: 0.7).CGColor
    border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width:  textField.frame.size.width, height: textField.frame.size.height)
    
    border.borderWidth = width
    textField.layer.addSublayer(border)
    textField.layer.masksToBounds = true
}
