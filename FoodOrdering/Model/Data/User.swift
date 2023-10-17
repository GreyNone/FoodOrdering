//
//  UserManager.swift
//  FoodOrdering
//
//  Created by Александр Василевич on 14.10.23.
//

import SwiftUI

struct UserData: Codable {
    
    var firstName = ""
    var lastName = ""
    var phoneNumber = ""
    var email = ""
    var streetAddress = ""
    var floor = ""
    var apartment = ""
    
//    enum CodingKeys: String, CodingKey {
//        case firstName, lastName, phoneNumber, email, streetAddress, floor, apartment
//    }
//    
//    required init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        firstName = try values.decode(String.self, forKey: .firstName)
//        lastName = try values.decode(String.self, forKey: .lastName)
//        phoneNumber = try values.decode(String.self, forKey: .phoneNumber)
//        email = try values.decode(String.self, forKey: .email)
//        streetAddress = try values.decode(String.self, forKey: .streetAddress)
//        floor = try values.decode(String.self, forKey: .floor)
//        apartment = try values.decode(String.self, forKey: .apartment)
//    }
//    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(firstName, forKey: .firstName)
//        try container.encode(lastName, forKey: .lastName)
//        try container.encode(phoneNumber, forKey: .phoneNumber)
//        try container.encode(email, forKey: .email)
//        try container.encode(streetAddress, forKey: .streetAddress)
//        try container.encode(floor, forKey: .floor)
//        try container.encode(apartment, forKey: .apartment)
//    }
}

final class User: ObservableObject {
    
    @AppStorage("userData") private var storage: Data?
    @Published var userData = UserData()
    
    func saveUserData() -> AlertItem? {
        var alertItem: AlertItem?
        
        do {
            let data = try JSONEncoder().encode(userData)
            storage = data
            alertItem = AlertType.saveSuccessAlert
        } catch {
            alertItem = AlertType.saveErrorAlert
        }
        
        return alertItem
    }

    func getUserData() {
        guard let storage = storage else { return }

        do {
            userData = try JSONDecoder().decode(UserData.self, from: storage)
        } catch {
            print(error.localizedDescription)
        }
    }
}
