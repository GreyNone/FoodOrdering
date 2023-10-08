//
//  DismissButton.swift
//  FoodOrdering
//
//  Created by Александр Василевич on 7.10.23.
//

import SwiftUI

struct DismissButton: View {
    var body: some View {
        Image(systemName: "xmark")
            .imageScale(.medium)
            .frame(width: 44, height: 44)
            .foregroundColor(Color("mainColor"))
    }
}

struct DismissButton_Previews: PreviewProvider {
    static var previews: some View {
        DismissButton()
    }
}
