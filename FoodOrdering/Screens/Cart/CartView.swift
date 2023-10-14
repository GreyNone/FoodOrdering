//
//  CartView.swift
//  FoodOrdering
//
//  Created by Александр Василевич on 5.10.23.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var order: Order
    @ObservedObject var cartViewModel = CartViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    List() {
                        ForEach(order.orderItems) { item in
                            MenuListCell(menuItem: item)
                        }
                        .onDelete { indexSet in
                            cartViewModel.order?.removeFromOrder(offsets: indexSet)
                        }
                    }
                    .listStyle(.plain)
                    
                    Button {
                        cartViewModel.isShowingCheckOutView = true
                    } label: {
                        MainButton(text: "Check out order - \(order.totalOrderPrice , specifier: "%.2f") $")
                    }
                    .padding(.bottom, 25)
                }
                
                if order.orderItems.isEmpty {
                    EmptyOrderView()
                }
            }
            .navigationTitle("Your Order")
            .navigationDestination(isPresented: $cartViewModel.isShowingCheckOutView) {
                CheckOutView()
            }
            .onAppear() {
                cartViewModel.order = order
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView().environmentObject({ () -> Order in
            let enviromentObject = Order()
            enviromentObject.orderItems = MockData.sampleItems
            return enviromentObject
        } () )
    }
}
