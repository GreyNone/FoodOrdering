//
//  AccountViewModel.swift
//  FoodOrdering
//
//  Created by Александр Василевич on 8.10.23.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @Published var alertItem: AlertItem?
    @Published var isShowingAlert = false
    var user: User?
    
    func saveUserData() {
        guard isValid else { return }
        
        let resultAlertItem = user?.saveUserData()
        alertItem = resultAlertItem
        isShowingAlert = true
    }
    
    private var isValid: Bool {
        guard let user = user else { return false }
        guard !user.userData.firstName.isEmpty &&
                !user.userData.lastName.isEmpty &&
                !user.userData.phoneNumber.isEmpty else {
            alertItem = AlertType.formAlert
            isShowingAlert = true
            return false
        }
        
        guard user.userData.email.isValidEmailFormat else {
            alertItem = AlertType.emailAlert
            isShowingAlert = true
            return false
        }
        
        guard !user.userData.streetAddress.isEmpty &&
                !user.userData.floor.isEmpty &&
                !user.userData.apartment.isEmpty else {
            alertItem = AlertType.addressAlert
            isShowingAlert = true
            return false
        }
        return true
    }
}
