//
//  MenuItemImageView.swift
//  FoodOrdering
//
//  Created by Александр Василевич on 7.10.23.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func load(imageUrl: String) {
        NetworkManager.shared.loadImage(imageString: imageUrl) { fetchedImage in
            guard let fetchedImage = fetchedImage else { return }
            DispatchQueue.main.async { [weak self] in
                self?.image = Image(uiImage: fetchedImage)
            }
        }
    }
}

struct FetchedImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("menuItemPlaceholderImage").resizable()
    }
}

struct MenuItemImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let imageUrl: String
    
    var body: some View {
        FetchedImage(image: imageLoader.image)
            .onAppear() {
                imageLoader.load(imageUrl: imageUrl)
            }
    }
}
