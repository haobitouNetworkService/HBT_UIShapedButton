Pod::Spec.new do |s|
  s.name         = "HBT_UIShapedButton"
  s.version      = "1.0.0"
  s.license      = "MIT"
  s.summary      = "custom the shape of UIButton on iOS."
  s.homepage     = "https://github.com/haobitouNetworkService/HBT_UIShapedButton"
  s.authors      = { "hackjie" => "codelijie@gmail.com" }
  s.platform     = :ios, "6.0"
  s.source       = { :git => "https://github.com/haobitouNetworkService/HBT_UIShapedButton.git", :tag => "1.0.0" }
  s.requires_arc = true
  s.source_files  = "HBT_UIShapedButton/*.{h,m}"
  s.frameworks = "Foundation", "CoreGraphics", "UIKit"
end
