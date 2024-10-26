//
//  ImagePrefetcher.swift
//  SPMandSDKSwiftUI
//
//  Created by Rafiul Hasan on 10/25/24.
//

import SwiftUI
import SDWebImageSwiftUI

final class ImagePrefetcher {
    static let instane = ImagePrefetcher()
    private var prefetcher = SDWebImagePrefetcher()
    
    private init() {}
    
    func startPrefetching(urls: [URL]) {
        prefetcher.prefetchURLs(urls)
    }
    
    func stopPrefetching() {
        prefetcher.cancelPrefetching()
    }
}

import Kingfisher

final class KingfisherImagePrefetcher {
    static let instane = KingfisherImagePrefetcher()
    private var prefetcher: [[URL] : Kingfisher.ImagePrefetcher] = [:]
    
    private init() {}
    
    func startPrefetching(urls: [URL]) {
        prefetcher[urls] = Kingfisher.ImagePrefetcher(urls: urls)
        prefetcher[urls]?.start()
    }
    
    func stopPrefetching(urls: [URL]) {
        prefetcher[urls]?.stop()
    }
}
