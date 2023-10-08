//
//  AddToCartButton.swift
//  FoodOrdering
//
//  Created by Александр Василевич on 7.10.23.
//

import SwiftUI

struct AddToCartButton: View {
    
    var price: Float
    
    var body: some View {
        HStack {
            Text("Add To Cart - \(price , specifier: "%.2f") $")
                .frame(width: 200,height: 70)
                .background(Color("mainColor"))
                .cornerRadius(10)
        }
    }
}

struct AddToCartButton_Previews: PreviewProvider {
    static var previews: some View {
        AddToCartButton(price: 10.5)
    }
}
