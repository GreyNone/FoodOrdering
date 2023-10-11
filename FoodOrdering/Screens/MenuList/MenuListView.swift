//
//  FoodListView.swift
//  FoodOrdering
//
//  Created by Александр Василевич on 5.10.23.
//

import SwiftUI

struct MenuListView: View {
    
    @StateObject var menuListViewModel = MenuListViewModel()
    
    var body: some View {
        NavigationStack {
//            SegmentedView()
            List(menuListViewModel.menuItems) { item in
                MenuListCell(menuItem: item)
                    .onTapGesture {
                        menuListViewModel.selectedMenuItem = item
                    }
                    .onAppear() {
                        menuListViewModel.getMoreMenuItems(currentMenuItem: item)
                    }
            }
            .navigationTitle("Menu List")
            .listStyle(.plain)
        }
        .onAppear() {
            menuListViewModel.getMenuItems(menuType: menuListViewModel.currentMenuType)
        }
//        .task {
//            <#code#>
//        }
        .sheet(isPresented: $menuListViewModel.isShowingDetailView) {
            ItemDetailView(menuItem: menuListViewModel.selectedMenuItem ?? MenuItem(),
                           isShowingDetailView: $menuListViewModel.isShowingDetailView)
        }
    }
}

struct FoodListView_Previews: PreviewProvider {
    static var previews: some View {
        MenuListView()
    }
}

//struct SegmentedView: View {
//
//    @State var selectedFood = ""
//    var foodItem = ["Burger", "Sushi", "Pizza"]
//
//    var body: some View {
//        VStack {
//            Picker("Select your food", selection: $selectedFood) {
//                ForEach(foodItem, id: \.self) {
//                    Text($0)
//                }
//            }
//            .colorMultiply(Color("mainColor"))
//            .pickerStyle(.segmented)
//        }
//    }
//}
