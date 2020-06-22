//
//  GsCustomAlertAnimation.swift
//
//  Created by Gaganjot singh on 04/11/19.
//
//

import UIKit

public enum GsCustomAlertAnimationType {
    case slideModalBottom
    case slideModalLeft
    case slideModalRight
    case slideModalTop
    case fadeIn
    case popIn
    case bounceModalBottom
    case bounceModalLeft
    case bounceModalRight
    case bounceModalTop
}

class GsCustomAlertPresentationManager: NSObject, UIViewControllerTransitioningDelegate {
   
   var animationType: GsCustomAlertAnimationType = .slideModalBottom
   var presentDuration: TimeInterval = 0.5
   var dismissDuration: TimeInterval = 0.3
   
   
   func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
      return GsCustomAlertPresentTransitioning(animationType: self.animationType, duration: presentDuration)
   }
   
   func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
      return GsCustomAlertDimissTransitioning(animationType: self.animationType, duration: dismissDuration)
   }
   
}
