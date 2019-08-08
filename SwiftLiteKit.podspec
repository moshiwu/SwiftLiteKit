#
# Be sure to run `pod lib lint SwiftLiteKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'SwiftLiteKit'
    s.version          = '0.9.3'
    s.summary          = 'Some extension for swift in my work.'
    s.ios.deployment_target = '10.0'
    s.swift_version = '5.0'

    s.description      = <<-DESC
    Some extension for swift in my work...
    DESC
    
    s.homepage         = 'https://github.com/moshiwu/SwiftLiteKit'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'moshiwu' => '183795044@qq.com' }
    s.source           = { :git => 'https://github.com/moshiwu/SwiftLiteKit.git', :tag => s.version.to_s }
    
    
    s.default_subspecs = 'Core', 'Class', 'Struct', 'Protocol'
    s.frameworks = 'UIKit'

    s.subspec 'Core' do |sp|
        sp.source_files = 'SwiftLiteKit/Classes/Core/**/*.swift'
    end
    
    s.subspec 'Class' do |sp|
        sp.source_files = 'SwiftLiteKit/Classes/Class/**/*.swift'
        sp.dependency 'SwiftLiteKit/Core'
    end

    s.subspec 'Struct' do |sp|
        sp.source_files = 'SwiftLiteKit/Classes/Struct/**/*.swift'
        sp.dependency 'SwiftLiteKit/Core'
    end

    s.subspec 'Protocol' do |sp|
        sp.source_files = 'SwiftLiteKit/Classes/Protocol/**/*.swift'
        sp.dependency 'SwiftLiteKit/Core'
    end

    s.subspec 'YYKit+Extension' do |sp|
      sp.source_files = 'SwiftLiteKit/Classes/YYKit+Extension/**/*.swift'
      sp.dependency 'SwiftLiteKit/Core'
      sp.dependency 'YYKit'
    end

    
end

