#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = "ShinobiPlayUtils"
  s.version          = '0.1.7'
  s.summary          = "Files common to ShinobiPlay projects"
  s.description      = <<-DESC
                       Files common to ShinobiPlay projects, e.g. utility classes and base classes
                       DESC
  s.homepage         = "http://www.shinobicontrols.com"
  s.license          = 'Apache License, Version 2.0'
  s.author           = { "Alison Clarke" => "aclarke@scottlogic.co.uk" }
  s.source           = { :git => "https://bitbucket.org/shinobicontrols/shinobi-play-utils.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/shinobicontrols'
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files = 'ShinobiPlayUtils/ShinobiPlayUtils/**/*.{h,m}'
  s.frameworks = 'QuartzCore', 'ShinobiCharts'
  s.xcconfig     = { 'FRAMEWORK_SEARCH_PATHS' => '"$(DEVELOPER_FRAMEWORKS_DIR)"' }
end
