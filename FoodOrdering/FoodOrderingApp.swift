//
//  FoodOrderingApp.swift
//  FoodOrdering
//
//  Created by Александр Василевич on 5.10.23.
//

import SwiftUI

@main
struct FoodOrderingApp: App {
    
    var order = Order()
    var user = User()
    
    var body: some Scene {
        WindowGroup {
            FoodOrderingTabView()
                .environmentObject(order)
                .environmentObject(user)
                .onAppear() {
                    user.getUserData()
                }
        }
    }
}
