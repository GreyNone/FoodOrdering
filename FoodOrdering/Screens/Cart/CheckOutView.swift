//
//  CheckOutView.swift
//  FoodOrdering
//
//  Created by Александр Василевич on 11.10.23.
//

import SwiftUI

struct CheckOutView: View {
    
    @StateObject var checkOutViewModel = CheckOutViewModel()
    @FocusState private var focusStateTextField: FocusedField?
    @EnvironmentObject var order: Order
    @EnvironmentObject var user: User
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section {
                        TextField("Street", text: $user.userData.streetAddress)
                            .focused($focusStateTextField, equals: .streetAddress)
                            .onSubmit {
                                focusStateTextField = .floor
                            }
                            .submitLabel(.next)
                        
                        TextField("Floor", text: $user.userData.apartment)
                            .focused($focusStateTextField, equals: .floor)
                            .onSubmit {
                                focusStateTextField = .apartment
                            }
                            .submitLabel(.next)
                            .keyboardType(.namePhonePad)
                        
                        TextField("Apartment", text: $user.userData.floor)
                            .focused($focusStateTextField, equals: .apartment)
                            .onSubmit {
                                focusStateTextField = nil
                            }
                            .submitLabel(.done)
                            .keyboardType(.namePhonePad)
                        
                    } header: {
                        Text("Your Address")
                    }
                }
                .formStyle(.columns)
                
                List() {
                    ForEach(order.orderItems) { item in
                        MenuListCell(menuItem: item)
                    }
                }
                .listStyle(.plain)
                
                Button {
                    
                } label: {
                    MainButton(text: "Place order")
                }
                .padding(.bottom, 15)
                
            }
            .navigationTitle("Check Out")
            .onAppear() {
                checkOutViewModel.order = order
                checkOutViewModel.user = user
            }
        }
    }
    
}

struct CheckOutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckOutView()
            .environmentObject({ () -> Order in
            let enviromentObject = Order()
            enviromentObject.orderItems = MockData.sampleItems
            return enviromentObject
        } () )
        .environmentObject({ () -> User in
            let enviromentObject = User()
            enviromentObject.userData = UserData()
            return enviromentObject
        } () )
    }
}
