Pod::Spec.new do |s|
  s.name = 'Briggs'
  s.version = '1.1.1'
  s.license = 'MIT'
  s.summary = 'A reimagination of UITraitCollection'
  s.homepage = 'https://github.com/auswahlaxiom/Briggs'
  s.authors = { 'Ada Turner' => 'ada.l.turner@gmail.com' }
  s.source = { :git => 'https://github.com/auswahlaxiom/Briggs.git', :tag => s.version }

  s.ios.deployment_target = '9.0'

  s.source_files = 'Source/*.swift'
end
