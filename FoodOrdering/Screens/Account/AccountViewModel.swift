//
//  AccountViewModel.swift
//  FoodOrdering
//
//  Created by Александр Василевич on 8.10.23.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @AppStorage("userData") private var storage: Data?
    @Published var userData = UserData()
    @Published var alertItem: AlertItem?
    @Published var isShowingAlert = false
    
    func saveUserData() {
        guard isValid else { return }

        do {
            let data = try JSONEncoder().encode(userData)
            storage = data
            alertItem = AlertType.saveSuccessAlert
            isShowingAlert = true
        } catch {
            alertItem = AlertType.saveErrorAlert
            isShowingAlert = true
        }
    }

    func getUserData() {
        guard let storage = storage else { return }

        do {
            userData = try JSONDecoder().decode(UserData.self, from: storage)
        } catch {
            alertItem = AlertType.retrieveErrorAlert
            isShowingAlert = true
        }
    }
    
    private var isValid: Bool {
        guard !userData.firstName.isEmpty &&
                !userData.lastName.isEmpty &&
                !userData.phoneNumber.isEmpty else {
            alertItem = AlertType.formAlert
            isShowingAlert = true
            return false
        }
        
        guard !userData.email.isEmpty else {
            alertItem = AlertType.emailAlert
            isShowingAlert = true
            return false
        }
        
        guard !userData.streetAddress.isEmpty &&
                !userData.floor.isEmpty &&
                !userData.apartment.isEmpty else {
            alertItem = AlertType.addressAlert
            isShowingAlert = true
            return false
        }
        return true
    }
}
