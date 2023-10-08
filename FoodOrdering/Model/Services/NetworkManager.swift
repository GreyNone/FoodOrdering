//
//  NetworkManager.swift
//  FoodOrdering
//
//  Created by Александр Василевич on 6.10.23.
//

import UIKit
import Moya

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let moyaProvider = MoyaProvider<MoyaService>()
    
    func loadMenuItems(itemType: MoyaService, completion: @escaping ([MenuItem]) -> Void) {
        moyaProvider.request(itemType) { result in
            switch result {
            case .success(let response):
                let fetchedMenuItems = try? response.map(MenuItems.self)
                if let fetchedMenuItems = fetchedMenuItems {
                    completion(fetchedMenuItems.menuItems)
                }
            case .failure(_):
                let emptyMenuItems = [MenuItem]()
                completion(emptyMenuItems)
            }
        }
    }
    
    func loadMenuItemInformation(itemId: Int, completion: @escaping (MenuItemInformation) -> Void) {
        moyaProvider.request(.itemInformation(itemId)) { result in
            switch result {
            case .success(let response):
                let fetchedMenuItemInformation = try? response.map(MenuItemInformation.self)
                if let fetchedMenuItemInformation = fetchedMenuItemInformation {
                    completion(fetchedMenuItemInformation)
                }
            case .failure(_):
                completion(MockData.sampleMenuItemInformation)
            }
        }
    }
    
    func loadImage(imageString: String, completion: @escaping (UIImage?) -> Void) {
        if let image = CacheManager.shared.getValue(for: imageString) {
            completion(image)
            return
        }
        
        moyaProvider.request(.image(imageString)) { result in
            switch result {
            case .success(let response):
                var image: UIImage?
                
                defer {
                    DispatchQueue.main.async {
                        if let image = image {
                            CacheManager.shared.write(value: image, for: imageString)
                        }
                        completion(image)
                    }
                }
                
                image = UIImage(data: response.data)
            case .failure(_):
                let placeholderImage = UIImage(named: "menuItemPlaceholderImage")
                completion(placeholderImage)
            }
        }
    }
}
