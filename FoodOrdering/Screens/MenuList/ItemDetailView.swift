//
//  ItemDetailView.swift
//  FoodOrdering
//
//  Created by Александр Василевич on 7.10.23.
//

import SwiftUI

struct ItemDetailView: View {
    
    var menuItem: MenuItem
    @Binding var isShowingDetailView: Bool
    @State var itemInformation: MenuItemInformation? = nil
    
    var body: some View {
        VStack(spacing: 15) {
            MenuItemImage(imageUrl: menuItem.image ?? "")
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 170)
            
            Text(menuItem.title ?? "")
                .fixedSize(horizontal: false, vertical: true)
                .font(.title2)
                .fontWeight(.bold)
            
            List(itemInformation?.nutrition?.nutrients ?? [Nutrient]()) { nutrient in
                NutrientsView(nutrient: nutrient)
            }
            
            Text("Calories: \(itemInformation?.nutrition?.calories ?? 0.0, specifier: "%.1f")")
            
            Button {
                
            } label: {
                AddToCartButton(text: "Add To Cart - \((itemInformation?.price ?? 10.0), specifier: "%.2f") $")
            }
            
            .onAppear() {
                NetworkManager.shared.loadMenuItemInformation(itemId: menuItem.id ?? 1) {
                    fetchedMenuItemInformation in
                    self.itemInformation = fetchedMenuItemInformation
                }
            }
        }
        .overlay(alignment: .topTrailing) {
            Button {
                isShowingDetailView = false
            } label: {
                DismissButton()
            }
        }
    }

}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(menuItem: MockData.sampleItem, isShowingDetailView: .constant(false))
            .preferredColorScheme(.dark)
    }
}

