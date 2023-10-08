//
//  MockData.swift
//  FoodOrdering
//
//  Created by Александр Василевич on 8.10.23.
//

import Foundation

struct MockData {
    
    static let sampleItem = MenuItem(id: 00001, title: "Burger", restaurantChain: "MacDuck", image: "menuItemPlaceholderImage")
    static let sampleItems = [sampleItem, sampleItem, sampleItem]
    
    static let sampleNutrient = Nutrient(name: "Fat",
                                         amount: 30,
                                         unit: "g",
                                         percentOfDailyNeeds: 35)
    
    static let sampleNutrients = Nutrition(nutrients: [sampleNutrient, sampleNutrient])
    
    static let sampleMenuItemInformation = MenuItemInformation(nutrition: sampleNutrients,
                                                               price: 100,
                                                               servings: nil)
}
