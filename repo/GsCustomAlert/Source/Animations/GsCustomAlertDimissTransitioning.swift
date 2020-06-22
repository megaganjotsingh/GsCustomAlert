//
//  GsCustomAlertDimissedTransitioning.swift
//
//  Created by Gaganjot singh on 01/03/20.
//
//

import UIKit

class GsCustomAlertDimissTransitioning: GsTransitioning, UIViewControllerAnimatedTransitioning {
   
   public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
      return duration
   }
   
   public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
      guard let fromVC = transitionContext.viewController(forKey: .from) as? GsCustomAlert else {return}
      
      let GsCustomAlertView = fromVC.GsCustomAlertVw
      let duration = transitionDuration(using: transitionContext)
      
      UIView.animate(withDuration: duration, animations: {
        self.dismissGsCustomAlertAnimation(GsCustomAlertView: GsCustomAlertView)
            fromVC.view.backgroundColor = .clear
      }) { (finished) in
         transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
      }
   }
}
