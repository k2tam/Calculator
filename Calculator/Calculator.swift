//
//  Calculator.swift
//  Calculator
//
//  Created by k2 tam on 28/07/2022.
//

import Foundation

class Calculator: ObservableObject{
    
    
    //Used to update UI
    @Published var displayValue = "0"
    
    //Store the current operator
    var currentOp: Operator?
    
    //Current number selected
    var currentNumber: Double? = 0
    
    //Previous nubmer selected
    var previousNumber: Double?
    
    //Flag for equal is pressed
    var equaled = false
    
    ///Selected appropriate fucntion based on the the label of button pressed
    func buttonPressed(label: String){
        if label == "CE"{
            reset()
        }else if label == "="{
            equalClicked()
        }else if label == "." {
            decimalClicked()
        }else if let value = Double(label){
            numberPressed(value: value)
        }else{
            operatorPressed(op: Operator())
        }
    }
    
    
    func reset(){
        
    }
    
    func equalClicked(){
        
    }
    
    func decimalClicked(){
        
    }
    
    func numberPressed(value: Double){
        
    }
    
    func operatorPressed(op: Operator){
        
    }
    
}
