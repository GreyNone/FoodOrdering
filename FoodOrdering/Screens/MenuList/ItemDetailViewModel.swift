//
//  ItemDetailViewModel.swift
//  FoodOrdering
//
//  Created by Александр Василевич on 7.10.23.
//

import SwiftUI

final class ItemDetailViewModel: ObservableObject {
    
    var menuItem: MenuItem?
    @Published var isShowingDetailView: Bool?
    @Published var itemInformation: MenuItemInformation? = nil
    @EnvironmentObject var order: Order
    
}

