//
//  ItemDetailView.swift
//  FoodOrdering
//
//  Created by Александр Василевич on 7.10.23.
//

import SwiftUI

struct ItemDetailView: View {
    
    @EnvironmentObject var order: Order
    @ObservedObject var itemDetailViewModel: ItemDetailViewModel
    
    var body: some View {
        VStack(spacing: 15) {
            MenuItemImage(imageUrl: itemDetailViewModel.menuItem.image ?? "")
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 170)
            
            Text(itemDetailViewModel.menuItem.title ?? "")
                .fixedSize(horizontal: false, vertical: true)
                .font(.title2)
                .fontWeight(.bold)
            
            List(itemDetailViewModel.itemInformation?.nutrition?.nutrients ?? [Nutrient]()) { nutrient in
                NutrientViewCell(nutrient: nutrient)
            }
            .listStyle(.plain)
            
            Text("Calories: \(itemDetailViewModel.itemInformation?.nutrition?.calories ?? 0.0, specifier: "%.1f")")
            
            Button {
                itemDetailViewModel.order?.addToOrder(item: itemDetailViewModel.menuItem)
                itemDetailViewModel.isShowingDetailView.wrappedValue = false
            } label: {
                MainButton(text: "Add To Cart - \((itemDetailViewModel.itemInformation?.price ?? 10.0), specifier: "%.2f") $")
            } 
            .onAppear() {
                itemDetailViewModel.getItemDetails()
                itemDetailViewModel.order = order
            }
        }
        .overlay(alignment: .topTrailing) {
            Button {
                itemDetailViewModel.isShowingDetailView.wrappedValue = false
            } label: {
                DismissButton()
            }
        }
    }

}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(itemDetailViewModel: ItemDetailViewModel(menuItem: MockData.firstSampleItem,
                                                                isShowingDetailView: .constant(false)))
        .environmentObject({ () -> Order in
            let enviromentObject = Order()
            enviromentObject.orderItems = MockData.sampleItems
            return enviromentObject
        } () )
            .preferredColorScheme(.dark)
    }
}

