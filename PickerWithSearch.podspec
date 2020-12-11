Pod::Spec.new do |s|
s.name             = 'PickerWithSearch'  
s.version          = '1.0.0'  
s.summary          = 'Custom picker supporting search and other features for iOS' 
s.authors          = { 'Hadi Yaacoub' => 'hadi.jacob@gmail.com' }
s.homepage         = 'https://github.com/HadiYaac/PickerWithSearch.git'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'username' => 'hadi.jacob@gmail.com' }
s.source           = { :git => 'https://github.com/HadiYaac/PickerWithSearch.git', :tag => 'v1.0.0' }
s.ios.deployment_target = '11.0'
s.source_files = 'Code/PickerWithSearch/*.swift'
s.ios.source_files   = 'Code/PickerWithSearch/*.swift'
end
