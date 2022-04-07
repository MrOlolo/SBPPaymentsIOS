#
# Be sure to run `pod lib lint SBPWidget.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SBPWidget'
  s.version          = '1.3.0'
  s.summary          = 'SBPWidget provide modal window with list of banks'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/0-mykola/SBPWidget'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Mykola Hordynchuk' => 'dev.nikolaz@gmail.com' }
  s.source           = { :git => 'https://github.com/mrololo/SBPWidget.git', :tag => s.version.to_s }

  s.source_files = 'SBPWidget/Sources/**/*'
  s.resources = 'SBPWidget/Assets/**/*'

  s.swift_version = '5.0'
  s.ios.deployment_target  = '13.0'

end
