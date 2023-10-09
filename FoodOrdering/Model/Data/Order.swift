//
//  Order.swift
//  FoodOrdering
//
//  Created by Александр Василевич on 9.10.23.
//

import SwiftUI

final class Order: ObservableObject {
    
    @Published var orderItems: [MenuItem] = []
    
    func addToOrder(item: MenuItem) {
        orderItems.append(item)
    }
    
    func removeFromOrder
}
