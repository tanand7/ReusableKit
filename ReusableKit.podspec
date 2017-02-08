Pod::Spec.new do |s|

  s.name         = "ReusableKit"
  s.version      = "1.0.1"
  s.summary      = "It helps you to make your coding more easy."
  s.description  = "reusable kit contains lot of reusable codes that helps you to make your life more easy. This is basically for iOS developer who uses iOS 9 or greater."

  s.homepage     = "https://about.me/tanand7"
  s.license      = "MIT"
  s.author       = "Anand T"

  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/tanand7/ReusableKit.git", :tag => "1.0.1" }
  s.framework    = "UIKit"
  s.source_files  = "ReusableKit", "ReusableKit/**/*.{h,m,swift}"
  s.exclude_files = "Classes/Exclude"
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3' }

end
