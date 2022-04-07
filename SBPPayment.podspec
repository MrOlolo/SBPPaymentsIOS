#
# Be sure to run `pod lib lint SBPWidget.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SBPPayment'
  s.version          = '1.3.1'
  s.summary          = 'SBPPayment (Old SBPWidget by Mykola Hordynchuk) provide modal window with list of banks which support sbp'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/MrOlolo/SBPPaymentsIOS'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'MrOlolo' => '' }
  s.source           = { :git => 'https://github.com/MrOlolo/SBPPaymentsIOS.git', :tag => s.version.to_s }

  s.source_files = 'SBPWidget/Sources/**/*'
  s.resources = 'SBPWidget/Assets/**/*'

  s.swift_version = '5.0'
  s.ios.deployment_target  = '13.0'

end
