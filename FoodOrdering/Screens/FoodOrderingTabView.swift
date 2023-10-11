//
//  ContentView.swift
//  FoodOrdering
//
//  Created by Александр Василевич on 5.10.23.
//

import SwiftUI

struct FoodOrderingTabView: View {
    
    @EnvironmentObject var order: Order
    var body: some View {
        TabView {
            MenuListView()
                .tabItem {
                    Label("Food", systemImage: "fork.knife.circle.fill")
                }
            
            CartView()
                .tabItem {
                    Label("Cart", systemImage: "cart.circle.fill")
                }
                .badge(order.orderItems.count)
            
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person.circle.fill")
                }
        }
        .onAppear() {
            UITabBar.appearance().backgroundColor = .black
        }
        .tint(Color("mainColor"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FoodOrderingTabView().environmentObject({ () -> Order in
            let enviromentObject = Order()
            enviromentObject.orderItems = MockData.sampleItems
            return enviromentObject
        } () )
            .preferredColorScheme(.dark)
        
    }
}
