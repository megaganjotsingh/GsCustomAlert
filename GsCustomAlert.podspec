#
#  Be sure to run `pod spec lint GsCustomAlert.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.name         = "GsCustomAlert"
  spec.version      = "1.0"
  spec.summary      = "Make the view, we give the way to present it, Simple, easy and highly customizable UIAlertView or pop up written in Swift"

  spec.description  = <<-DESC
  Animated Alert View written in Swift, which can be used as a UIAlertView or UIAlertController replacement. GsCustomAlert allows you to personalize your alertView so that it matches your application layout
  
            DESC

  spec.homepage     = "https://github.com/megaganjotsingh/GsCustomAlert"
 #   spec.screenshots  = "https://github.com/megaganjotsingh/GsCustomAlert/blob/master/GifGsAlert/bounceModelBottom.gif", "https://github.com/megaganjotsingh/GsCustomAlert/blob/master/GifGsAlert/bounceModelLeft.gif","https://github.com/megaganjotsingh/GsCustomAlert/blob/master/GifGsAlert/bounceModelRight.gif","https://github.com/megaganjotsingh/GsCustomAlert/blob/master/GifGsAlert/bounceModelTop.gif","https://github.com/megaganjotsingh/GsCustomAlert/blob/master/GifGsAlert/fade.gif","https://github.com/megaganjotsingh/GsCustomAlert/blob/master/GifGsAlert/popin.gif","https://github.com/megaganjotsingh/GsCustomAlert/blob/master/GifGsAlert/slideModelBottom.gif","https://github.com/megaganjotsingh/GsCustomAlert/blob/master/GifGsAlert/slideModelLeft.gif","https://github.com/megaganjotsingh/GsCustomAlert/blob/master/GifGsAlert/slideModelRight.gif","https://github.com/megaganjotsingh/GsCustomAlert/blob/master/GifGsAlert/slideModelTop.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See https://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  spec.license      = "MIT"

  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.author             = { "Gaganjot singh" => "megaganjotsingh@gmail.com" }
   spec.social_media_url   = "https://www.facebook.com/gaganjot.singh.1884"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
    spec.platform     = :ios, "11.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  spec.source       = { :git => "https://github.com/megaganjotsingh/GsCustomAlert.git", :tag => '1.0.0' }
  spec.swift_version = '4.2'



  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  spec.source_files  = "GsCustomAlert/Source/**/*"

  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

    spec.framework  = "UIKit"

  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
    spec.requires_arc = true

end
