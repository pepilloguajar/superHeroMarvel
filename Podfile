# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

def shared_pods
    use_frameworks!
    inhibit_all_warnings!
    pod 'Alamofire', '4.6.0'
    pod 'lottie-ios'
    pod 'SwiftLint'
end

target 'SuperHeroMarvelDEV' do
    workspace 'SuperHeroMarvel'
    project 'SuperHeroMarvel'
    shared_pods
end

target 'SuperHeroMarvel' do
    workspace 'SuperHeroMarvel'
    project 'SuperHeroMarvel'
    shared_pods
end
