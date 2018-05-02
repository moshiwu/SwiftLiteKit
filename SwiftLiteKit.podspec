#
# Be sure to run `pod lib lint SwiftLiteKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'SwiftLiteKit'
    s.version          = '0.6.1'
    s.summary          = 'Some extension for swift in my work.'
    
    # This description is used to generate tags and improve search results.
    #   * Think: What does it do? Why did you write it? What is the focus?
    #   * Try to keep it short, snappy and to the point.
    #   * Write the description between the DESC delimiters below.
    #   * Finally, don't worry about the indent, CocoaPods strips it!
    
    s.description      = <<-DESC
    Some extension for swift in my work...
    DESC
    
    s.homepage         = 'https://github.com/moshiwu/SwiftLiteKit'
    
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'moshiwu' => '183795044@qq.com' }
    s.source           = { :git => 'https://github.com/moshiwu/SwiftLiteKit.git', :tag => s.version.to_s }
    
    s.ios.deployment_target = '8.0'
    
    s.source_files = 'SwiftLiteKit/Classes/*.swift'
    
    s.subspec 'Class' do |sp|
        sp.source_files = 'SwiftLiteKit/Classes/Class/**/*.swift'
    end
    
    s.subspec 'Struct' do |sp|
        sp.source_files = 'SwiftLiteKit/Classes/Struct/**/*.swift'
    end
    
    s.subspec 'Protocol' do |sp|
        sp.source_files = 'SwiftLiteKit/Classes/Protocol/**/*.swift'
    end
    s.subspec 'Other' do |sp|
        sp.source_files = 'SwiftLiteKit/Classes/Other/**/*.swift'
    end
    
    
    
    # s.resource_bundles = {
    #   'SwiftLiteKit' => ['SwiftLiteKit/Assets/*.png']
    # }
    
    # s.public_header_files = 'Pod/Classes/**/*.h'
    # s.frameworks = 'UIKit', 'MapKit'
    # s.dependency 'AFNetworking', '~> 2.3'
end

