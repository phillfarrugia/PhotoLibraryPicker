//
//  PhotoLibraryPickerResult.swift
//  PhotoLibraryPicker
//
//  Created by Phill Farrugia on 10/3/18.
//  Copyright © 2018 Phill Farrugia. All rights reserved.
//

import Foundation

/// Defines the result of a PhotoLibraryPickerHandler request
/// to fetch an item from the user's photo library.
public enum PhotoLibraryPickerResult {

    /// Request completed, fetched asset provided.
    case completed(PhotoLibraryAsset)

    /// Request cancelled.
    case cancelled
    
}
