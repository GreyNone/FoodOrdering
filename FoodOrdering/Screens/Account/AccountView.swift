//
//  AccountView.swift
//  FoodOrdering
//
//  Created by Александр Василевич on 5.10.23.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section {
                        TextField("Your First Name", text: $viewModel.userData.firstName)
                        TextField("Your Last Name", text: $viewModel.userData.lastName)
                        TextField("Your Email", text: $viewModel.userData.email)
                            .textInputAutocapitalization(.never)
                            .keyboardType(.emailAddress)
                            .autocorrectionDisabled()
                        TextField("Your Phone Number", text: $viewModel.userData.phoneNumber)
                            .keyboardType(.namePhonePad)
                        DatePicker("Your Birthday", selection: $viewModel.userData.birthDate, displayedComponents: .date)
                    } header: {
                        Text("Personal")
                    }
                    
                    Section {
                        TextField("Street Address", text: $viewModel.userData.streetAddress)
                        TextField("Floor", text: $viewModel.userData.floor)
                            .keyboardType(.namePhonePad)
                        TextField("Apartment", text: $viewModel.userData.apartment)
                            .keyboardType(.namePhonePad)
                    } header: {
                        Text("Delivery Address")
                    }
                }
                
                Button {
                    viewModel.saveUserData()
                } label: {
                    ConfirmButton()
                }
                .padding(.bottom, 20)
                
                .navigationTitle("Your Account")
            }
            .onAppear() {
                viewModel.getUserData()
            }
            .alert(isPresented: $viewModel.isShowingAlert) {
                guard let alert = viewModel.alertItem else {
                    return Alert(title: Text("Error"),
                                 message: Text(""),
                                 dismissButton: .default(Text("OK")))
                }
                return Alert(title: alert.title,
                      message: alert.message,
                      dismissButton: alert.dismissButton)
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
