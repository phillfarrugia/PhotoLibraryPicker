//
//  PhotoLibraryAsset.swift
//  PhotoLibraryPicker
//
//  Created by Phill Farrugia on 10/3/18.
//  Copyright © 2018 Phill Farrugia. All rights reserved.
//

import Foundation

/// Defines an asset that is imported from the users photo library such as
/// an image or video. Encapsulates information about the asset such as it's
/// type and source.
public struct PhotoLibraryAsset {

    /// Asset Type
    public let assetType: PhotoLibraryAssetType

    /// Asset Source
    public let source: PhotoLibrarySource

    init(assetType: PhotoLibraryAssetType,
         source: PhotoLibrarySource) {
        self.assetType = assetType
        self.source = source
    }

}
