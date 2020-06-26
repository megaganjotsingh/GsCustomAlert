 GsCustomAlert
---
  Make the view, we give the way to present it.
  It is a Simple, easy and highly customizable UIAlertView or pop up written in Swift.
  
  ![bounceModelBottom](https://github.com/megaganjotsingh/GsCustomAlert/blob/master/GifGsAlert/bounceModelBottom.gif)_

  
  
  
  
 Installation
 ---

### [CocoaPods](http://cocoapods.org)

  
  To install GsCustomAlert using CocoaPods, integrate it in your existing Podfile, or create a new Podfile:
  
  `  pod 'GsCustomAlert', '~> 1.0'`
  
### [Carthage](https://github.com/Carthage/Carthage)

  To install add the following line to your Cartfile:

  `github "megaganjotsingh/GsCustomAlert" "master"`
  
  Easy to Use
  ---
  ### For Present 
  
  ```swift
        let alertView = YourView.instantiateFromNib()
        let alert = GsCustomAlert(customView: alertView, tapToDismiss: false)
        alert.animationType = .popIn
        self.present(alert, animated: true, completion: nil)
  ```
  
  ### For Dismiss

```swift
       alert.dismiss(animated: true, completion: nil)
```
  
  Collaboration
---

I tried to build an easy to use API, but I'm sure there are ways of improving and adding more features, If you think that we can do the GsCustomAlert more powerful please contribute with this project.




