//
//  MenuListViewModel.swift
//  FoodOrdering
//
//  Created by Александр Василевич on 6.10.23.
//

import SwiftUI

final class MenuListViewModel: ObservableObject {
    
    @Published var menuItems: [MenuItem] = []
    @Published var isShowingDetailView = false
    var selectedMenuItem: MenuItem? {
        didSet {
            isShowingDetailView = true
        }
    }
    
    func getMenuItems() {
        NetworkManager.shared.loadMenuItems(itemType: .burger) { menuItems in
            DispatchQueue.main.async {
                self.menuItems = menuItems
            }
        }
    }
}

