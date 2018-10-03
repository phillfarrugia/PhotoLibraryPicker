//
//  PhotoLibraryAssetType.swift
//  PhotoLibraryPicker
//
//  Created by Phill Farrugia on 10/3/18.
//  Copyright © 2018 Phill Farrugia. All rights reserved.
//

import UIKit

/// Defines the media types of PhotoLibraryAssets.
public enum PhotoLibraryAssetType {

    /// Image, UIImage provided.
    case image(UIImage)

    // Video, local URL of video provided.
    case video(URL)
    
}
