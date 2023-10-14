//
//  CheckOutViewModel.swift
//  FoodOrdering
//
//  Created by Александр Василевич on 11.10.23.
//

import SwiftUI

final class CheckOutViewModel: ObservableObject {
    
    @AppStorage("userData") private var storage: Data?
    @Published var userData = UserData()
    var order: Order?
    
//    func saveUserData() {
////        guard isValid else { return }
//
//        do {
//            let data = try JSONEncoder().encode(userData)
//            storage = data
////            alertItem = AlertType.saveSuccessAlert
////            isShowingAlert = true
//        } catch {
////            alertItem = AlertType.saveErrorAlert
////            isShowingAlert = true
//        }
//    }

    func getUserData() {
        guard let storage = storage else { return }

        do {
            userData = try JSONDecoder().decode(UserData.self, from: storage)
        } catch {
//            alertItem = AlertType.retrieveErrorAlert
//            isShowingAlert = true
        }
    }
}
