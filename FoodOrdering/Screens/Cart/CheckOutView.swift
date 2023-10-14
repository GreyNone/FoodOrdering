//
//  CheckOutView.swift
//  FoodOrdering
//
//  Created by Александр Василевич on 11.10.23.
//

import SwiftUI

struct CheckOutView: View {
    
    @StateObject var checkOutViewModel = CheckOutViewModel()
    @EnvironmentObject var order: Order
    @FocusState private var focusStateTextField: FocusedField?
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section {
                        TextField("Street", text: $checkOutViewModel.userData.streetAddress)
                            .focused($focusStateTextField, equals: .streetAddress)
                            .onSubmit {
                                focusStateTextField = .floor
                            }
                            .submitLabel(.next)
                        
                        TextField("Floor", text: $checkOutViewModel.userData.apartment)
                            .focused($focusStateTextField, equals: .floor)
                            .onSubmit {
                                focusStateTextField = .apartment
                            }
                            .submitLabel(.next)
                            .keyboardType(.namePhonePad)
                        
                        TextField("Apartment", text: $checkOutViewModel.userData.floor)
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
                    ForEach(checkOutViewModel.order?.orderItems ?? MockData.sampleItems) { item in
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
                checkOutViewModel.getUserData()
                checkOutViewModel.order = order
            }
        }
    }
    
}

struct CheckOutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckOutView().environmentObject({ () -> Order in
            let enviromentObject = Order()
            enviromentObject.orderItems = MockData.sampleItems
            return enviromentObject
        } () )
    }
}
