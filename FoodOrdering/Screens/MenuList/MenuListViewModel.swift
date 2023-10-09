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
    private var menuType: [MoyaService] = [.burger, .pizza, .sushi]
    private var currentTypeIndex = 0
    var selectedMenuItem: MenuItem? {
        didSet {
            isShowingDetailView = true
        }
    }
    var currentMenuType: MoyaService {
        menuType[currentTypeIndex]
    }
    
    func getMenuItems(menuType: MoyaService) {
        NetworkManager.shared.loadMenuItems(itemType: menuType) { menuItems in
            DispatchQueue.main.async {
                self.menuItems.append(contentsOf: menuItems)
            }
        }
    }
    
    func getMoreMenuItems(currentMenuItem: MenuItem) {
        let previousIndex = menuItems.index(menuItems.endIndex, offsetBy: -1)
        if previousIndex == menuItems.firstIndex(where: { menuItem in
            menuItem.id == currentMenuItem.id
        }) {
            guard currentTypeIndex < menuType.count - 1 else {
                return
            }
            currentTypeIndex += 1
            getMenuItems(menuType: currentMenuType)
        }
    }
}

