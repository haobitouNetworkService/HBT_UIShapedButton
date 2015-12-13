Pod::Spec.new do |s|
  s.name         = "HBT_UIShapedButton"
  s.version      = "1.0.0"
  s.license      = "MIT"
  s.summary      = "custom the shape of UIButton on iOS."
  s.description  = <<-DESC
                    创建不规则形状的 UIButton
                   DESC
  s.homepage     = "https://github.com/haobitouNetworkService/HBT_UIShapedButton"
  s.authors      = { "hackjie" => "codelijie@gmail.com" }
  s.social_media_url = "https://twitter.com/codelijie"
  s.platform     = :ios, "6.0"
  s.source       = { :git => "https://github.com/haobitouNetworkService/HBT_UIShapedButton.git", :tag => s.version.to_s }
  s.requires_arc = true
  s.source_files  = "HBT_UIShapedButton/*"
  s.frameworks = "Foundation", "CoreGraphics", "UIKit"
end
