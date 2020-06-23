//
//  GsTransitioning.swift
//
//  Created by Gaganjot singh on 01/03/20.
//
//

import UIKit

private enum GsAnimationEdge {
  case none
  case top
  case bottom
  case left
  case right
}

class GsTransitioning: NSObject {
   
   var animationType: GsCustomAlertAnimationType
   var duration: TimeInterval
   
   init(animationType: GsCustomAlertAnimationType, duration: TimeInterval) {
      self.animationType = animationType
      self.duration = duration
      super.init()
   }
   
   func buildGsCustomAlertAnimation(GsCustomAlertView: UIView) {
      switch animationType {
        case .slideModalBottom:
            slideIn(from: .bottom, view: GsCustomAlertView)
           break
           
        case .slideModalLeft:
           slideIn(from: .left, view: GsCustomAlertView)
           break
           
        case .slideModalRight:
           slideIn(from: .right, view: GsCustomAlertView)
           break
            
        case .slideModalTop:
            slideIn(from: .top, view: GsCustomAlertView)
            break
           
        case .fadeIn:
           GsCustomAlertView.alpha = 1
           break
          
        case .bounceModalBottom:
            bounceIn(from: .bottom, view: GsCustomAlertView)
          break
        case .bounceModalLeft:
            bounceIn(from: .left, view: GsCustomAlertView)
          break
        case .bounceModalRight:
            bounceIn(from: .right, view: GsCustomAlertView)
          break
            
        case .bounceModalTop:
            bounceIn(from: .top, view: GsCustomAlertView)
            break
        case .popIn:
        GsCustomAlertView.isHidden = false
        GsCustomAlertView.alpha = 0
        GsCustomAlertView.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
        UIView.animate(
            withDuration: duration, delay: 0.2, usingSpringWithDamping: 0.55, initialSpringVelocity: 3,
          options: .curveEaseOut, animations: {
            GsCustomAlertView.transform = .identity
            GsCustomAlertView.alpha = 1
          }, completion: nil)
        break
      
    }
   }
    
    func dismissGsCustomAlertAnimation(GsCustomAlertView: UIView) {
        switch animationType {
        case .slideModalBottom:
            slideOut(to: .bottom, view: GsCustomAlertView)
           break
           
        case .slideModalLeft:
           slideOut(to: .left, view: GsCustomAlertView)
           break
           
        case .slideModalRight:
           slideOut(to: .right, view: GsCustomAlertView)
           break
            
        case .slideModalTop:
            slideOut(to: .top, view: GsCustomAlertView)
            break
           
        case .fadeIn:
           GsCustomAlertView.alpha = 0
           break
          
        case .bounceModalBottom:
            bounceOut(to: .bottom, view: GsCustomAlertView)
          break
        case .bounceModalLeft:
            bounceOut(to: .left, view: GsCustomAlertView)
          break
        case .bounceModalRight:
            bounceOut(to: .right, view: GsCustomAlertView)
          break
            
        case .bounceModalTop:
            bounceOut(to: .top, view: GsCustomAlertView)
            break
        case .popIn:
          let endTransform = CGAffineTransform(scaleX: 0.4, y: 0.4)
          let prepareTransform = CGAffineTransform(scaleX: 1.1, y: 1.1)
          UIView.animateKeyframes(
            withDuration: duration, delay: 0, options: .calculationModeCubic, animations: {
              UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.2) {
                GsCustomAlertView.transform = prepareTransform
              }
              UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.3) {
                GsCustomAlertView.transform = prepareTransform
              }
              UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                GsCustomAlertView.transform = endTransform
                GsCustomAlertView.alpha = 0
              }
            }, completion: nil)
          break
        }
    }
}

extension GsTransitioning {
    fileprivate func slideIn(from edge: GsAnimationEdge = .none, view: UIView,
                                     x: CGFloat = 0,
                                     y: CGFloat = 0,
                                     duration: TimeInterval = 1,
                                     delay: TimeInterval = 0,
                                     completion: ((Bool) -> Void)? = nil) {
        let offset = offsetForPresent(edge: edge, view: view)

        let delta = CGPoint(x: offset.x + x, y: offset.y + y)
        let endTransform = CGAffineTransform(translationX: delta.x*0.1, y: delta.y*0.1)
        let prepareTransform = CGAffineTransform(translationX: delta.x, y: delta.y)
        UIView.animateKeyframes(
          withDuration: duration, delay: delay, options: .calculationModeCubic, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.0) {
              view.transform = prepareTransform
            }
            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.7) {
                view.transform = endTransform
            }
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.75) {
                view.transform = .identity
            }
          }, completion: completion)
       
     }
    
    fileprivate func slideOut(to edge: GsAnimationEdge = .none, view: UIView,
                                     x: CGFloat = 0,
                                     y: CGFloat = 0,
                                     duration: TimeInterval = 0.25,
                                     delay: TimeInterval = 0,
                                     completion: ((Bool) -> Void)? = nil) {
        let offset = offsetFor(edge: edge, view: view)
      let endTransform = CGAffineTransform(translationX: offset.x + x, y: offset.y + y)
      UIView.animate(
        withDuration: duration, delay: delay, options: .curveEaseOut, animations: {
          view.transform = endTransform
        }, completion: completion)
    }
    
    fileprivate func bounceIn(from edge: GsAnimationEdge = .none, view: UIView,
                                      x: CGFloat = 0,
                                      y: CGFloat = 0,
                                      duration: TimeInterval = 0.5,
                                      delay: TimeInterval = 0,
                                      completion: ((Bool) -> Void)? = nil)  {
        let offset = offsetForPresent(edge: edge, view: view)
        
        let delta = CGPoint(x: offset.x + x, y: offset.y + y)
        let endTransform = CGAffineTransform(translationX: delta.x, y: delta.y)
        let prepareTransform = CGAffineTransform(translationX: -delta.x * 0.2, y: -delta.y * 0.2)
        UIView.animateKeyframes(
          withDuration: duration, delay: delay, options: .calculationModeCubic, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.0) {
              view.transform = endTransform
            }
            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.4) {
              view.transform = prepareTransform
            }
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.8) {
                view.transform = .identity
            }
          }, completion: completion)
        
     }
    
    fileprivate func bounceOut(to edge: GsAnimationEdge = .none, view: UIView,
                                      x: CGFloat = 0,
                                      y: CGFloat = 0,
                                      duration: TimeInterval = 0.35,
                                      delay: TimeInterval = 0,
                                      completion: ((Bool) -> Void)? = nil)  {
        let offset = offsetFor(edge: edge, view: view)
      let delta = CGPoint(x: offset.x + x, y: offset.y + y)
      let endTransform = CGAffineTransform(translationX: delta.x, y: delta.y)
      let prepareTransform = CGAffineTransform(translationX: -delta.x * 0.2, y: -delta.y * 0.2)
      UIView.animateKeyframes(
        withDuration: duration, delay: delay, options: .calculationModeCubic, animations: {
          UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.2) {
            view.transform = prepareTransform
          }
          UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.2) {
            view.transform = prepareTransform
          }
          UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.6) {
            view.transform = endTransform
          }
        }, completion: completion)
      
    }
    
    private func offsetFor(edge: GsAnimationEdge, view: UIView) -> CGPoint {
      let parentSize = view.subviews[0].frame.size
        switch edge {
        case .none: return CGPoint.zero
        case .top: return CGPoint(x: 0, y: -view.frame.maxY)
        case .bottom: return CGPoint(x: 0, y: view.frame.maxY)
        case .left: return CGPoint(x: -view.frame.maxX, y: 0)
        case .right: return CGPoint(x: parentSize.width - view.frame.minX, y: 0)
        }
    }
    
    private func offsetForPresent(edge: GsAnimationEdge, view: UIView) -> CGPoint {
        let parentSize = view.subviews[0].frame.size
        switch edge {
        case .none: return CGPoint.zero
        case .top: return CGPoint(x: 0, y: -view.subviews[0].frame.maxY)
        case .bottom: return CGPoint(x: 0, y: parentSize.height - view.subviews[0].frame.minY)
        case .left: return CGPoint(x: -view.subviews[0].frame.maxX, y: 0)
        case .right: return CGPoint(x: parentSize.width - view.subviews[0].frame.minX, y: 0)
        }
    }
}
