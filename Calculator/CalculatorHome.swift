//
//  ContentView.swift
//  Calculator
//
//  Created by k2 tam on 28/07/2022.
//

import SwiftUI

//Custom colors
let darkerGray = Color(CGColor(gray: 0.1, alpha: 0.1))
let darkGray = Color(CGColor(gray: 0.3, alpha: 1))

struct CalculatorHome: View {
    var body: some View {
        GeometryReader{ geo in
            VStack(alignment: .trailing, spacing: 0){
                Spacer()
                //Text result
                Text("0")
                    .foregroundColor(.white)
                    .font(.system(size: 60))
                    .lineLimit(1)
                    .padding(.vertical, 20)
                
                //Display calculator rows
                VStack(spacing: 10){
                    CalculatorRow(labels: ["CE","","",String("\u{00f7}")], colors: [.gray,.gray,.gray,.orange])
                    
                    CalculatorRow(labels: ["7","8","9","X"], colors: [darkGray,darkGray,darkGray,.orange])
                    
                    CalculatorRow(labels: ["4","5","6","-"], colors: [darkGray,darkGray,darkGray,.orange])
                    
                    CalculatorRow(labels: ["1","2","3","+"], colors: [darkGray,darkGray,darkGray,.orange])
                    
                    CalculatorRow(labels: ["0",",","","="], colors: [darkGray,darkGray,darkGray,.orange])

                }
                .frame(height: geo.size.height*0.6)
            }
           
            .padding([.horizontal])
           
        }
        .background(.black)
        
        

       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorHome()
    }
}
