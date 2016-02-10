Pod::Spec.new do |s|
  s.name             = "SwrveUnitySDK"
  s.version          = "4.2.0"
  s.summary          = "iOS Common library for Swrve."
  s.homepage         = "http://www.swrve.com"
  s.license          = { "type" => "Apache License, Version 2.0", "file" => "LICENSE" }
  s.authors          = "Swrve Mobile Inc or its licensors"
  s.source           = { :git => "https://github.com/Swrve/swrve-ios-sdk.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/Swrve_Inc'

  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'UnitySDK/**/*.{mm,m,h}'
  s.public_header_files = 'UnitySDK/**/*.h'
  s.dependency 'SwrveSDKCommon'
  s.dependency 'SwrveConversationSDK'
  s.dependency 'SwrveLocationSDK'
end
