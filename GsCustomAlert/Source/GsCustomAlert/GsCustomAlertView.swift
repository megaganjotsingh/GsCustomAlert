//
//  GsCustomAlertView.swift
//
//  Created by Gaganjot singh on 31/10/19.
//
//

import UIKit

public class GsCustomAlertView: UIView {
    
    init() {
        super.init(frame: .zero)
        clipsToBounds = true
    }
    
    required public init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    private var inset: CGFloat = 0 {
       didSet { refreshViews() }
    }
    
    private var customViewConstraints: [NSLayoutConstraint] = []
    
    private var customView: UIView? {
       didSet {
          if let oldValue = oldValue {
             oldValue.removeFromSuperview()  
          }
       }
    }
    
    private func refreshViews() {
       updateCustomViewConstraints()
    }

    private func updateCustomViewConstraints() {
       guard let customView = customView else { return }
       
       NSLayoutConstraint.deactivate(customViewConstraints)
       customView.translatesAutoresizingMaskIntoConstraints = false
       customViewConstraints = [
          customView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -inset),
          customView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: inset)
       ]
       
          customViewConstraints.append(customView.topAnchor.constraint(equalTo: self.topAnchor, constant: inset))
          customViewConstraints.append(customView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -inset))
       
       
       NSLayoutConstraint.activate(customViewConstraints)
    }
    
    func setCustomView(_ customView: UIView?) {
       guard let customView = customView else { return }
       self.customView = customView
       self.addSubview(customView)
       refreshViews()
    }
}

