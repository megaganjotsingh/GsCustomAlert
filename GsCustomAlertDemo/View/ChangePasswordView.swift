//
//  ChangePasswordView.swift
//  NisiWater
//
//  Created by Gagan Mac on 16/06/20.
//  Copyright © 2020 Gaganjot singh. All rights reserved.
//

import UIKit

class ChangePasswordView: UIView {

    @IBOutlet weak var view_textFieldContainer: UIView!
    
    @IBOutlet weak var label_top: UILabel!
    @IBOutlet weak var textField_EnterSomething: UITextField!
    @IBOutlet weak var btn_done: UIButton!
    @IBOutlet weak var btn_cancel: UIButton!
    
    class func instantiateFromNib() -> ChangePasswordView {
           return Bundle.main.loadNibNamed("ChangePasswordView", owner: nil, options: nil)!.first as! ChangePasswordView
    }
    override func layoutSubviews() {
        view_textFieldContainer.layer.borderColor = #colorLiteral(red: 0.1835676134, green: 0.41447258, blue: 0.8676421046, alpha: 1)
    }
    
}
