//
//  ConfirmButton.swift
//  FoodOrdering
//
//  Created by Александр Василевич on 8.10.23.
//

import SwiftUI

struct ConfirmButton: View {
    
    var body: some View {
        Text("Confirm")
            .frame(width: 160, height: 50)
            .foregroundColor(.white)
            .background(.green)
            .cornerRadius(10)
    }
}

struct ConfirmButton_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmButton()
    }
}
