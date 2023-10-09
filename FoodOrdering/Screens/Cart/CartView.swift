//
//  CartView.swift
//  FoodOrdering
//
//  Created by Александр Василевич on 5.10.23.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    List() {
                        ForEach(order.orderItems) { item in
                            MenuListCell(menuItem: item)
                        }
                        .onDelete { indexSet in
                            order.orderItems.remove(atOffsets: indexSet)
                        }
                    }
                    .listStyle(.plain)
                    
                    Button {
                        
                    } label: {
                        AddToCartButton(text: "Check out order - \(10.0 , specifier: "%.2f") $")
                    }
                    .padding(.bottom, 25)
                }
                
                if order.orderItems.isEmpty {
                    EmptyOrderView()
                }
            }
            .navigationTitle("Your Order")
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
