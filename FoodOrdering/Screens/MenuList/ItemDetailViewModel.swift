//
//  ItemDetailViewModel.swift
//  FoodOrdering
//
//  Created by Александр Василевич on 7.10.23.
//

import SwiftUI

final class ItemDetailViewModel: ObservableObject {
    
    var menuItem: MenuItem
    var isShowingDetailView: Binding<Bool>
    var order: Order?
    @Published var itemInformation: MenuItemInformation?
    
    init(menuItem: MenuItem, isShowingDetailView: Binding<Bool>, itemInformation: MenuItemInformation? = nil) {
        self.menuItem = menuItem
        self.isShowingDetailView = isShowingDetailView
    }
    
    func getItemDetails() {
        NetworkManager.shared.loadMenuItemInformation(itemId: menuItem.id ?? 1) { [weak self] fetchedMenuItemInformation in
            self?.itemInformation = fetchedMenuItemInformation
        }
    }
}


