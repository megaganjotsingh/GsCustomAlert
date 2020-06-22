//
//  BaseGsCustomAlertViewController.swift
//
//  Created by Gaganjot singh on 01/11/19.
//
//

import UIKit

public class GsCustomAlertViewController: UIViewController {
   
   private(set) var keyboardRect = CGRect.zero
   
   func listenKeyboard(){
    NotificationCenter.default.addObserver(self, selector: #selector(GsCustomAlertViewController.keyboardWillShow(sender:)), name: , object: nil)
      NotificationCenter.default.addObserver(self, selector: #selector(GsCustomAlertViewController.keyboardWillHide(sender:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
   }
   
   @objc func keyboardWillShow(sender: NSNotification){
      guard let userInfo = sender.userInfo else {
         return
      }
      
      if let keyboardRect = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as AnyObject).cgRectValue{
         self.keyboardRect = keyboardRect
      }
   }
   
   @objc func keyboardWillHide(sender: NSNotification){
      keyboardRect = CGRect.zero
   }
}
