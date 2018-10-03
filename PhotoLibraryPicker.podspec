#
# Be sure to run `pod lib lint PhotoLibraryPicker.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PhotoLibraryPicker'
  s.version          = '0.1.0'
  s.summary          = 'A basic wrapper around UIImagePickerController that simplifies presenting the Photo Library / Camera picker.'

  s.description      = <<-DESC
PhotoLibraryPicker is a basic Swift wrapper around UIImagePickerController that simplifies presenting the Photo Library / Camera picker. It
encapsules the UIImagePickerController and UIImagePickerControllerDelegate and provides a simple API for presenting the View Controllers,
and handling the assets that the user picks.
                       DESC

  s.homepage         = 'https://github.com/phillfarrugia/PhotoLibraryPicker'

  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'phillfarrugia' => 'me@phillfarrugia.com' }
  s.source           = { :git => 'https://github.com/phillfarrugia/PhotoLibraryPicker.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'

  s.source_files = 'PhotoLibraryPicker/Classes/**/*'
  
end
