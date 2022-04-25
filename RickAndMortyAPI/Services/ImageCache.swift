//
//  ImageCache.swift
//  RickAndMortyAPI
//
//  Created by Назар Ткаченко on 25.04.2022.
//

import Foundation
import UIKit

class ImageCache {
    static let shared = NSCache<NSString, UIImage>()
    private init() {}
}
