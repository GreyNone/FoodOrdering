//
//  Alerts.swift
//  FoodOrdering
//
//  Created by Александр Василевич on 8.10.23.
//

import SwiftUI

struct AlertItem: Identifiable {
    var id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertType {
    
    static let formAlert = AlertItem(title: Text("Error"),
                                 message: Text("Something went wrong,please check that you have filled in all the fields"),
                                 dismissButton: .default(Text("OK")))
    
    static let emailAlert = AlertItem(title: Text("Error"),
                                  message: Text("Something went wrong,please check your email"),
                                  dismissButton: .default(Text("OK")))
    
    static let addressAlert = AlertItem(title: Text("Error"),
                                        message: Text("Please,check your address"),
                                        dismissButton: .default(Text("OK")))
    
    static let saveSuccessAlert = AlertItem(title: Text("Success"),
                                            message: Text("Data saved successfully"),
                                            dismissButton: .default(Text("OK")))
    
    static let saveErrorAlert = AlertItem(title: Text("Error"),
                                          message: Text("Something went wrong,please check your data"),
                                          dismissButton: .default(Text("OK")))
    
    static let retrieveErrorAlert = AlertItem(title: Text("Error"),
                                                message: Text("Sorry,we are unable to retrieve your data"),
                                              dismissButton: .default(Text("OK")))
}
