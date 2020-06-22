//
//  GsCustomAlertAnimatedTransitioning.swift
//
//  Created by Gaganjot singh on 01/03/20.
//
//

import UIKit

class GsCustomAlertPresentTransitioning: GsTransitioning, UIViewControllerAnimatedTransitioning {
   
   var originFrame = UIScreen.main.bounds
   
   func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
      return duration
   }
   
   func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
      guard let toVC = transitionContext.viewController(forKey: .to) as? GsCustomAlert else {return}
      
      toVC.view.frame = originFrame
      transitionContext.containerView.addSubview(toVC.view)
      
      let GsCustomAlertView = toVC.GsCustomAlertVw
      
      let duration = transitionDuration(using: transitionContext)
    
    UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 2, options: .curveEaseOut, animations: {
        self.buildGsCustomAlertAnimation(GsCustomAlertView: GsCustomAlertView)
        toVC.view.backgroundColor = UIColor(white: 0, alpha: 0.4)
        }, completion: { (finished) in
           transitionContext.completeTransition(finished)
        })

   }
}
