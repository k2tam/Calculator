//
//  CalculatorRow.swift
//  Calculator
//
//  Created by k2 tam on 28/07/2022.
//

import SwiftUI

struct CalculatorRow: View {
    let calculatorColumns = 4
    
    var labels = ["","","",""]
    var colors:[Color] = [.gray,.gray,.gray,.orange]
    
    var body: some View {
        HStack(spacing: 10){
            ForEach(0..<calculatorColumns){index in
                CalculatorButton(label: labels[index], color: colors[index])
            }
        }
    }
}

struct CalculatorRow_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorRow(labels: ["1","2","3","+"],colors: [.gray,.gray,.gray,.orange])
    }
}
