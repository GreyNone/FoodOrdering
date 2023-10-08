//
//  Food.swift
//  FoodOrdering
//
//  Created by Александр Василевич on 6.10.23.
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

struct MenuItems: Decodable {
    var menuItems: [MenuItem]
    
    enum CodingKeys: String, CodingKey {
        case menuItems
    }
}

struct MenuItem: Decodable, Identifiable {
    var id: Int?
    var title: String?
    var restaurantChain: String?
    var image: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case restaurantChain
        case image
    }
}

struct Servings: Decodable {
    var number: Float?
    var size: Int?
    var unit: String?
    
    enum CodingKeys: String, CodingKey {
        case number
        case size
        case unit
    }
}

struct MenuItemInformation: Decodable {
    var nutrition: Nutrition?
    var price: Float?
    var servings: Servings?
    
    enum CodingKeys: String, CodingKey {
        case nutrition
        case price
        case servings
    }
}

struct Nutrition: Decodable {
    var nutrients: [Nutrient]?
    var calories: Float?
    
    enum CodingKeys: String, CodingKey {
        case nutrients
        case calories
    }
}

struct Nutrient: Decodable{
    var name: String?
    var amount: Float?
    var unit: String?
    var percentOfDailyNeeds: Float?
    
    enum CodingKeys: String, CodingKey {
        case name
        case amount
        case unit
        case percentOfDailyNeeds
    }
}
