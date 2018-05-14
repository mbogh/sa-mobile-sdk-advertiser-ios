Pod::Spec.new do |s|
  s.name             = 'SuperAwesomeAdvertiser'
  s.version          = '2.0.0'
  s.summary          = 'SuperAwesome SDK for Advertisers'
  s.description      = <<-DESC
The SuperAwesome Mobile Advertising SDK lets you easily measure installs for your app in a COPPA/GDPR compliant way.
			DESC
  s.homepage         = 'https://github.com/SuperAwesomeLTD/sa-mobile-sdk-advertiser-ios'
  s.license          = { :type => "GNU GENERAL PUBLIC LICENSE Version 3", :file => "LICENSE" }
  s.author           = { 'Gabriel Coman' => 'gabriel.coman@superawesome.tv' }
  s.source           = { :git => 'https://github.com/SuperAwesomeLTD/sa-mobile-sdk-advertiser-ios.git', :tag => '2.0.0' }
  s.platform         = :ios, '8.0'
  s.default_subspec  = 'Base'
  s.requires_arc     = true

  s.subspec 'Base' do |b|
    b.source_files = 'Pod/Classes/**/*'
  end

  s.subspec 'AIR' do |a|
    a.dependency 'SuperAwesomeAdvertiser/Base'
    a.source_files = 'Pod/Plugin/AIR/*'
  end

  s.subspec 'Unity' do |u|
    u.dependency 'SuperAwesomeAdvertiser/Base'
    u.source_files = 'Pod/Plugin/Unity/*'
  end
end
