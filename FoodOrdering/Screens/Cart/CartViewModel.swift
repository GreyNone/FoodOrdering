//
//  CartViewModel.swift
//  FoodOrdering
//
//  Created by Александр Василевич on 10.10.23.
//

import SwiftUI

final class CartViewModel: ObservableObject {

    var order: Order?
    @Published var isShowingCheckOutView = false
}
