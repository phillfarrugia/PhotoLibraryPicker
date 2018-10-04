# PhotoLibraryPicker
A basic wrapper around UIImagePickerController that simplifies presenting the Photo Library / Camera picker.

## Getting Started

### Installation with CocoaPods

```ruby
pod 'PhotoLibraryPicker'
```

### Installation with Carthage

```
github "phillfarrugia/PhotoLibraryPicker"
```

## Usage

```swift
class ViewController: UIViewController {

    // Instantiate a PhotoLibraryPicker
    let imagePickerHandler = PhotoLibraryPicker()

    override func viewDidLoad() {
        super.viewDidLoad()

	// Present Photo Library Picker
        imagePickerHandler.presentLibraryPicker(fromViewController: self) { (result) in
            switch result {
            case let .completed(asset):
                handleAsset(asset)
            case .cancelled:
                handleCancellation()
            }
        }
    }

}

```

### Photo Library

Present a Photo Library picker (allows users to select either a photo, or a video from their Camera Roll or Albums) by calling `presentLibraryPicker(fromViewController:completion:)` and pass the View Controller to present from as well as a completion handler to be called once the user has picked an asset.

### Camera

Present a Camera picker (allows users to take a photo or a video from their camera) by calling `presentCameraPicker(fromViewController:completion:)` and pass the View Controller to present from as well as a completion handler to be called once the user has captured a photo or video.

### Handling Results

Results of both the Photo Library and Camera picker are encapsulated in a `PhotoLibraryPickerResult` enumuration (see [The Power of Result Types in Swift](https://www.swiftbysundell.com/posts/the-power-of-result-types-in-swift)), that is either `cancelled` - meaning user has cancelled and opted not to select a photo or video; or `completed` - the user has selected an asset which is passed as an associate value.

### Assets

Photos or Videos selected by the user are represented as a `PhotoLibraryAsset` struct containing the assetType (`image`, or `video`) and source (`library`, or `camera`). 

## Credits

PhotoLibraryPicker was created by [Phill Farrugia](https://twitter.com/@phillfarrugia).

It was originally created for use in a private project, and was open sourced to encourage decoupling and reusability as well as for the sake of trending towards open source software and building modular reusable frameworks.

## License

PhotoLibraryPicker is available under the MIT license. See the [LICENSE](https://raw.githubusercontent.com/phillfarrugia/PhotoLibraryPicker/master/LICENSE) file for more info.
