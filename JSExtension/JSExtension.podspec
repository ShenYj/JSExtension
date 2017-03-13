

Pod::Spec.new do |s|
  s.name         = "JSExtension"
  s.version      = "0.0.3"
  s.summary      = "项目开发中的工具"
  s.homepage     = "https://github.com/ShenYj/JSExtension"
  s.license      = "MIT"
  s.platform     = :ios, "8.0"
  s.author       = { "Ryan" => "shenyj4@51nb.com" }
  s.source       = { :git => "https://github.com/ShenYj/JSExtension.git", :tag => s.version }
  s.source_files = "JSExtension", "JSExtension/JSExtension/UIKit+JSExtension/*.{h,m}"
  s.requires_arc = true
end
