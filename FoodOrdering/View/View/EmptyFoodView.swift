//
//  EmptyFoodView.swift
//  FoodOrdering
//
//  Created by Александр Василевич on 12.10.23.
//

import SwiftUI

struct EmptyFoodView: View {
    
    var menuListViewModel: MenuListViewModel
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
            VStack {
                Spacer()
                
                Image("forkAndKnifeImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                
                Text("Failed to load menu,sorry. You can try again")
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Button {
                    menuListViewModel.getMenuItems(menuType: menuListViewModel.currentMenuType)
                } label: {
                    MainButton(text: "Try again")
                }
            }
            .offset(y: -30)
        }
    }
}

#Preview {
    EmptyFoodView(menuListViewModel: MenuListViewModel())
}
