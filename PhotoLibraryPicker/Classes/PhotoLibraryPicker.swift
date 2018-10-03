//
//  PhotoLibraryHandler.swift
//  PhotoLibraryPicker
//
//  Created by Phill Farrugia on 10/3/18.
//  Copyright © 2018 Phill Farrugia. All rights reserved.
//

import UIKit

/// Completion type specific to PhotoLibraryPickerHandler requests to fetch an image.
public typealias PhotoLibraryPickerCompletion = (_ result: PhotoLibraryPickerResult) -> Void

/// A class that coordinates the presenting of a UIImagePickerController and delivers the resulting
/// asset in a more concise and type safe interface.
public class PhotoLibraryPicker: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    /// ViewController which send a picker request.
    private var presentingViewController: UIViewController? = nil

    /// Completion called once picker request is complete.
    private var completion: PhotoLibraryPickerCompletion? = nil

    /// Key that represents a MovieType in `didFinishPickingMediaWithInfo`'s info dictionary.
    private static let kMovieMediaTypeKey = "public.movie"

    /// Key that represents an ImageType in `didFinishPickingMediaWithInfo`'s info dictionary.
    private static let kImageMediaTypeKey = "public.image"

    /// Presents a Photo Library picker that allows the user to pick an
    /// image or video from the library.
    ///
    /// - Parameter presentingViewController: View Controller picker should present from.
    /// - Parameter completion: Completion handler called with the result of the picker.
    public func presentLibraryPicker(fromViewController presentingViewController: UIViewController,
                              completion: @escaping PhotoLibraryPickerCompletion) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary),
            let availableMediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary) {
            let imagePickerController = UIImagePickerController()
            imagePickerController.mediaTypes = availableMediaTypes
            imagePickerController.delegate = self

            self.presentingViewController = presentingViewController
            self.completion = completion
            presentingViewController.present(imagePickerController, animated: true, completion: nil)
        }
    }

    /// Presents a Camera picker that allows the user to capture an image
    /// or video rom the camera.
    ///
    /// - Parameter presentingViewController: View Controller picker should present from.
    /// - Parameter completion: Completion handler called with the result of the picker.
    public func presentCameraPicker(fromViewController presentingViewController: UIViewController,
                             completion: @escaping PhotoLibraryPickerCompletion) {
        if UIImagePickerController.isSourceTypeAvailable(.camera),
            let availableMediaTypes = UIImagePickerController.availableMediaTypes(for: .camera) {
            let imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = .camera
            imagePickerController.mediaTypes = availableMediaTypes
            imagePickerController.delegate = self

            self.presentingViewController = presentingViewController
            self.completion = completion
            presentingViewController.present(imagePickerController, animated: true, completion: nil)
        }
    }

    // MARK: - UIImagePickerControllerDelegate

    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let mediaType = info[UIImagePickerControllerMediaType] as? String else {
            presentingViewController?.dismiss(animated: true, completion: nil)
            return
        }

        /// Asset Source
        let source = (picker.sourceType == .camera) ?
            PhotoLibrarySource.camera : PhotoLibrarySource.library

        /// Asset
        if mediaType == PhotoLibraryPicker.kMovieMediaTypeKey {
            if let videoURL = info[UIImagePickerControllerMediaURL] as? URL {
                completion?(.completed(PhotoLibraryAsset(assetType: .video(videoURL), source: source)))
            }
        } else if mediaType == PhotoLibraryPicker.kImageMediaTypeKey {
            if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
                completion?(.completed(PhotoLibraryAsset(assetType: .image(image), source: source)))
            }
        }

        presentingViewController?.dismiss(animated: true, completion: nil)
    }

    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }

}
