//
//  CacheManager.swift
//  FoodOrdering
//
//  Created by Александр Василевич on 7.10.23.
//

import Foundation
import SwiftUI

final class CacheManager {
    
    static let shared = CacheManager()
    private let cache = NSCache<AnyObject, AnyObject>()
    
    func getValue(for key: String) -> UIImage? {
        if let imageFromCache = cache.object(forKey: key as AnyObject) {
            let image = imageFromCache as? UIImage
            return image
        }
        return nil
    }
    
    func write(value: UIImage, for key: String) {
        cache.setObject(value, forKey: key as AnyObject)
    }
    
    func clean() {
        cache.removeAllObjects()
    }
}
