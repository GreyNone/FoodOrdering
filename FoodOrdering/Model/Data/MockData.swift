//
//  MockData.swift
//  FoodOrdering
//
//  Created by Александр Василевич on 8.10.23.
//

import Foundation

struct MockData {
    
    static let firstSampleItem = MenuItem(id: 00001, title: "Burger", restaurantChain: "MacDuck", image: "menuItemPlaceholderImage")
    static let secondSampleItem = MenuItem(id: 00002, title: "Pizza", restaurantChain: "Dominos", image: "menuItemPlaceholderImage")
    static let thirdSampleItem = MenuItem(id: 00003, title: "Sushi", restaurantChain: "Sushi House", image: "menuItemPlaceholderImage")
    static let sampleItems = [firstSampleItem, secondSampleItem, thirdSampleItem]
    
    static let sampleNutrient = Nutrient(name: "Fat",
                                         amount: 30,
                                         unit: "g",
                                         percentOfDailyNeeds: 35)
    
    static let sampleNutrients = Nutrition(nutrients: [sampleNutrient, sampleNutrient])
    
    static let sampleMenuItemInformation = MenuItemInformation(nutrition: sampleNutrients,
                                                               price: 100,
                                                               servings: nil)
}
