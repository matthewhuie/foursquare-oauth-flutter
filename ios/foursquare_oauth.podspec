#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'foursquare_oauth'
  s.version          = '0.0.1'
  s.summary          = 'Foursquare OAuth for Flutter'
  s.description      = <<-DESC
Foursquare OAuth for Flutter
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.dependency 'FSOAuth'

  s.ios.deployment_target = '8.0'
end

