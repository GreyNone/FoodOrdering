//
//  AccountView.swift
//  FoodOrdering
//
//  Created by Александр Василевич on 5.10.23.
//

import SwiftUI

struct AccountView: View {
    
    enum FocusedField {
        case firstName, lastName, phoneNumber, email, streetAddress, floor, apartment
    }
    @StateObject var viewModel = AccountViewModel()
    @FocusState private var focusStateTextField: FocusedField?
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section {
                        TextField("Your First Name", text: $viewModel.userData.firstName)
                            .focused($focusStateTextField, equals: .firstName)
                            .onSubmit {
                                focusStateTextField = .lastName
                            }
                            .submitLabel(.next)
                        
                        TextField("Your Last Name", text: $viewModel.userData.lastName)
                            .focused($focusStateTextField, equals: .lastName)
                            .onSubmit {
                                focusStateTextField = .email
                            }
                            .submitLabel(.next)
                        
                        TextField("Your Email", text: $viewModel.userData.email)
                            .focused($focusStateTextField, equals: .email)
                            .onSubmit {
                                focusStateTextField = .phoneNumber
                            }
                            .submitLabel(.next)
                            .textInputAutocapitalization(.never)
                            .keyboardType(.emailAddress)
                            .autocorrectionDisabled()
                        
                        TextField("Your Phone Number", text: $viewModel.userData.phoneNumber)
                            .focused($focusStateTextField, equals: .phoneNumber)
                            .onSubmit {
                                focusStateTextField = nil
                            }
                            .submitLabel(.done)
                            .keyboardType(.namePhonePad)
                    } header: {
                        Text("Personal")
                    }
                    
                    Section {
                        TextField("Street Address", text: $viewModel.userData.streetAddress)
                            .focused($focusStateTextField, equals: .streetAddress)
                            .onSubmit {
                                focusStateTextField = .floor
                            }
                            .submitLabel(.next)
                        
                        TextField("Floor", text: $viewModel.userData.floor)
                            .focused($focusStateTextField, equals: .floor)
                            .onSubmit {
                                focusStateTextField = .apartment
                            }
                            .submitLabel(.next)
                            .keyboardType(.namePhonePad)
                        
                        TextField("Apartment", text: $viewModel.userData.apartment)
                            .focused($focusStateTextField, equals: .apartment)
                            .onSubmit {
                                focusStateTextField = nil
                            }
                            .submitLabel(.done)
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
