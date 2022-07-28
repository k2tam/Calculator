//
//  CalculatorApp.swift
//  Calculator
//
//  Created by k2 tam on 28/07/2022.
//

import SwiftUI

@main
struct CalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            CalculatorHome()
                .environmentObject(Calculator())
        }
    }
}
