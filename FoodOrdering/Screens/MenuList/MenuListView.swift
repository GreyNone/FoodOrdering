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
            ZStack {
                List(menuListViewModel.menuItems) { item in
                    MenuListCell(menuItem: item)
                        .onTapGesture {
                            menuListViewModel.selectedMenuItem = item
                        }
                        .onAppear() {
                            menuListViewModel.getMoreMenuItems(currentMenuItem: item)
                        }
                }
                .listStyle(.plain)
                
                if menuListViewModel.menuItems.isEmpty {
                    EmptyFoodView(menuListViewModel: menuListViewModel)
                }
            }
        }
        .navigationTitle("Menu List")
        .onAppear() {
            menuListViewModel.getMenuItems(menuType: menuListViewModel.currentMenuType)
        }
        .sheet(isPresented: $menuListViewModel.isShowingDetailView) {
            ItemDetailView(itemDetailViewModel:
                            ItemDetailViewModel(menuItem: menuListViewModel.selectedMenuItem ?? MockData.firstSampleItem,
                                                isShowingDetailView: $menuListViewModel.isShowingDetailView))
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
