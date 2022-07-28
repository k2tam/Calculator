//
//  CalculatorButton.swift
//  Calculator
//
//  Created by k2 tam on 28/07/2022.
//

import SwiftUI

struct CalculatorButton: View {
    @EnvironmentObject var calculator: Calculator
    
    var label: String
    var color: Color
    
    var body: some View {
        Button {
            //Inform model of button pressed
            calculator.buttonPressed(label: label)
        } label: {
            ZStack{
                Circle()
                    .fill(color)
                
                Text(label)
                    .foregroundColor(.white)
                    .font(.title)
            }
        }
    }
}

struct CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButton(label: "1", color: .gray)
            .previewLayout(.fixed(width: 100, height: 100))
            .environmentObject(Calculator())
    }
}
