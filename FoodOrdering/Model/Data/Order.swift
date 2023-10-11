//
//  Order.swift
//  FoodOrdering
//
//  Created by Александр Василевич on 9.10.23.
//

import SwiftUI

final class Order: ObservableObject {
    
    @Published var orderItems: [MenuItem] = []
    
    var totalOrderPrice: Double {
        Double(orderItems.count) * 10.0
    }
    
    func addToOrder(item: MenuItem) {
        orderItems.append(item)
    }
    
    func removeFromOrder(offsets: IndexSet) {
         orderItems.remove(atOffsets: offsets)
    }
}
