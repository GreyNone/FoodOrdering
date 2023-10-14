//
//  NutrientsView.swift
//  FoodOrdering
//
//  Created by Александр Василевич on 7.10.23.
//

import SwiftUI

struct NutrientViewCell: View {
    
    var nutrient: Nutrient
    
    var body: some View {
        VStack {
            HStack {
                Text(nutrient.name ?? "No Data")
                    .fontWeight(.medium)
                
                Spacer()
                
                Text("\(nutrient.amount ?? 0, specifier: "%.1f")" )
                    .fontWeight(.bold)
                Text(nutrient.unit ?? "No Data")
                    .fontWeight(.bold)
            }
            
            HStack {
                Text("Percent of daily needs")
                    .fontWeight(.medium)
                
                Spacer()
                
                Text("\(nutrient.percentOfDailyNeeds ?? 0, specifier: "%.1f") %")
                    .fontWeight(.bold)
            }
        }
    }
}

struct NutrientView_Previews: PreviewProvider {
    static var previews: some View {
        NutrientViewCell(nutrient: MockData.sampleNutrient)
    }
}
