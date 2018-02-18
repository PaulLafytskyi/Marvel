platform :ios, '10.0'
inhibit_all_warnings!

target 'Marvel' do
    use_frameworks!
    pod 'Moya'
    pod 'RealmSwift', '~> 3.1.1'
    pod 'ObjectMapper+Realm'
    pod 'ReachabilitySwift', '~> 4.1.0'

    target 'MarvelTests' do
        inherit! :search_paths
        pod 'Cuckoo', '~> 0.10.2'
        pod 'Quick', '~> 1.2.0'
        pod 'Nimble', '~>7.0.3'
    end
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '4.0'
            config.build_settings['GCC_WARN_INHIBIT_ALL_WARNINGS'] = "YES"
        end
    end
end


