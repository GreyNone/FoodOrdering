//
//  EmptyOrderView.swift
//  FoodOrdering
//
//  Created by Александр Василевич on 9.10.23.
//

import SwiftUI

struct EmptyOrderView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
            VStack {
                Image("cartImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 150)
                
                Text("It's seems your cart is empty")
                    .font(.title2)
                    .fontWeight(.bold)
            }
        }
    }
}

struct EmptyOrderView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyOrderView()
    }
}
