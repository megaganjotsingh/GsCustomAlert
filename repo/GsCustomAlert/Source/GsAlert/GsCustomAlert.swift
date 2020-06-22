//
//  GsCustomAlertManager.swift
//
//  Created by Gaganjot singh on 01/11/19.
//
//

import UIKit

public class GsCustomAlert: GsCustomAlertViewController {
   
   // MARK: - private
   private let GsCustomAlertPresentationManagr = GsCustomAlertPresentationManager()
   
    
   // MARK: - internal
   let GsCustomAlertVw: GsCustomAlertView
   var GsCustomAlertConstraints: [NSLayoutConstraint] = []
   var visibleViewConstraints: [NSLayoutConstraint] = []
   
   let tapToDismiss: Bool
   var completionBlock: (() -> Void)?
   
   lazy var visibleView: UIView = {
      let visibleView = UIView()
      visibleView.translatesAutoresizingMaskIntoConstraints = false
      return visibleView
   }()
   
   required init?(coder aDecoder: NSCoder) {
      self.GsCustomAlertVw = GsCustomAlertView()
      self.tapToDismiss = false
      super.init(coder: aDecoder)
   }
   
   public init(title: String? = nil, customView: UIView? = nil, tapToDismiss: Bool = true, dismissOnActionTapped: Bool = true) {
      self.GsCustomAlertVw = GsCustomAlertView()
      self.tapToDismiss = tapToDismiss
      super.init(nibName: nil, bundle: nil)
      self.GsCustomAlertVw.setCustomView(customView)
      self.animationType = .slideModalBottom
      self.modalPresentationStyle = .custom
      self.transitioningDelegate = GsCustomAlertPresentationManagr
   }
   
    //MARK: - LifeCycle Functions
   override public func loadView() {
      super.loadView()
      
      GsCustomAlertVw.alpha = 1
      GsCustomAlertVw.translatesAutoresizingMaskIntoConstraints = false
      view.addSubview(visibleView)
      visibleView.addSubview(GsCustomAlertVw)
   }
   
   override public func viewDidLoad() {
      super.viewDidLoad()
      
      let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapOnView))
      tapRecognizer.cancelsTouchesInView = false
      self.view.addGestureRecognizer(tapRecognizer)
      listenKeyboard()
   }
   
   override public func viewDidLayoutSubviews() {
      super.viewDidLayoutSubviews()
      makeContraints()
   }
   
   override func keyboardWillShow(sender: NSNotification) {
      super.keyboardWillShow(sender: sender)
      self.viewDidLayoutSubviews()
      view.layoutIfNeeded()
   }
   
   override func keyboardWillHide(sender: NSNotification) {
      super.keyboardWillHide(sender: sender)
      self.viewDidLayoutSubviews()
      view.layoutIfNeeded()
   }
   
   deinit {
      #if DEBUG
      print("dealloc ---> GsCustomAlert")
      #endif
   }
}

extension GsCustomAlert {
    
    public var backgroundColor: UIColor? {
       get { return GsCustomAlertVw.backgroundColor }
       set { GsCustomAlertVw.backgroundColor = newValue }
    }
   
   /* Animation config */
   public var animationType: GsCustomAlertAnimationType  {
      get { return GsCustomAlertPresentationManagr.animationType }
      set { GsCustomAlertPresentationManagr.animationType = newValue }
   }
   
   public func onDismissGsCustomAlert(_ block: @escaping (() -> Void)) {
      self.completionBlock = block
   }
}


extension GsCustomAlert {
   
   @objc func tapOnView(_ sender: UITapGestureRecognizer) {
      if tapToDismiss && keyboardRect == .zero {
         let point = sender.location(in: self.view)
         
         let isPointInGsCustomAlertView = GsCustomAlertVw.frame.contains(point)
         if !isPointInGsCustomAlertView {
            dismiss(animated: true, completion: self.completionBlock)
         }
      } else {
         self.view.endEditing(true)
      }
   }
}


//MARK: - Constraints
extension GsCustomAlert {
   
   func makeContraints() {
      NSLayoutConstraint.deactivate(visibleViewConstraints)
      
      visibleViewConstraints = [
         visibleView.topAnchor.constraint(equalTo: view.topAnchor),
         visibleView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
         visibleView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         visibleView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -keyboardRect.size.height)
      ]
      
      NSLayoutConstraint.activate(visibleViewConstraints)
      visibleView.layoutIfNeeded()
      
      NSLayoutConstraint.deactivate(GsCustomAlertConstraints)
      GsCustomAlertConstraints = [
         GsCustomAlertVw.centerXAnchor.constraint(equalTo: visibleView.centerXAnchor),
         GsCustomAlertVw.centerYAnchor.constraint(equalTo: visibleView.centerYAnchor)
         
      ]
      
      if UIDevice.current.orientation.isLandscape {
        let trailingAnchor = GsCustomAlertVw.trailingAnchor.constraint(equalTo: visibleView.trailingAnchor, constant: -100)
        GsCustomAlertConstraints.append(trailingAnchor)
        let leadingAnchor = GsCustomAlertVw.leadingAnchor.constraint(equalTo: visibleView.leadingAnchor, constant: 100)
        GsCustomAlertConstraints.append(leadingAnchor)
      }
      else {
        let trailingAnchor = GsCustomAlertVw.trailingAnchor.constraint(equalTo: visibleView.trailingAnchor, constant: -25)
        GsCustomAlertConstraints.append(trailingAnchor)
        let leadingAnchor = GsCustomAlertVw.leadingAnchor.constraint(equalTo: visibleView.leadingAnchor, constant: 25)
        GsCustomAlertConstraints.append(leadingAnchor)
    }
      
      NSLayoutConstraint.activate(GsCustomAlertConstraints)
      GsCustomAlertVw.layoutIfNeeded()
   }
}
