//
//  Food.swift
//  FoodOrdering
//
//  Created by Александр Василевич on 6.10.23.
//

import Foundation

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

struct Nutrient: Decodable, Identifiable{
    var id = UUID()
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
