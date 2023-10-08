//
//  AddToCartButton.swift
//  FoodOrdering
//
//  Created by Александр Василевич on 7.10.23.
//

import SwiftUI

struct AddToCartButton: View {
    
    var text: LocalizedStringKey
    
    var body: some View {
        HStack {
            Text(text)
                .frame(width: 200,height: 70)
                .foregroundColor(.white)
                .background(Color("mainColor"))
                .cornerRadius(10)
        }
    }
}

struct AddToCartButton_Previews: PreviewProvider {
    static var previews: some View {
        AddToCartButton(text: "Add To Cart - 10.5 $")
    }
}
