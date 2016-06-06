Pod::Spec.new do |s|
    s.name         = 'CommonElement'
    s.version      = '0.1.0'
    s.license      = 'MIT'
    s.homepage     = 'https://github.com/BinBear/CommonElement'
    s.authors      = {'BinBear'=> '389294582@qq.com'}
    s.summary      = 'Common Element for iOS develop'
    s.platform     = :ios, '7.0'
    s.source       = {:git=>'https://github.com/BinBear/CommonElement.git',:tag => s.version}
    s.source_files = 'CommonElement/Classs//**/*.{h,m}'
    s.requires_arc = true

# Pod Dependencies

end