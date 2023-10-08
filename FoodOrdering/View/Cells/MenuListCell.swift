//
//  FoodListCell.swift
//  FoodOrdering
//
//  Created by Александр Василевич on 6.10.23.
//

import SwiftUI

struct MenuListCell: View {
    
    let menuItem: MenuItem
    
    var body: some View {
        HStack {
            MenuItemImage(imageUrl: menuItem.image ?? "")
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 100)
            
            VStack(alignment: .leading, spacing: 20) {
                Text(menuItem.title ?? "Error")
                    .font(.title)
                    .fontWeight(.regular)
                
                Text(menuItem.restaurantChain ?? "Error")
                    .font(.title3)
                    .fontWeight(.thin)
            }
        }
    }
    
}

struct MenuListCell_Previews: PreviewProvider {
    static var previews: some View {
        MenuListCell(menuItem: MockData.sampleItem)
    }
}
