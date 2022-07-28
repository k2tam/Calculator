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
    
    var decimalPlace = 0
    
    ///Selected appropriate fucntion based on the the label of button pressed
    func buttonPressed(label: String){
        if label == "CE"{
            displayValue = "0"
            reset()
        }else if label == "="{
            equalClicked()
        }else if label == "." {
            decimalClicked()
        }else if let value = Double(label){
            numberPressed(value: value)
        }else{
            operatorPressed(op: Operator(label))
        }
    }
    
    func setDisplayValue(number: Double){
        //Dont display decimal if number is integer
        if number == floor(number) {
            displayValue = "\(Int(number))"
        }else{
            //Otherwise display the decimal
            let decimalPlaces = 10
            displayValue = "\(round(number * pow(10,decimalPlaces)) / pow(10,decimalPlaces))"
            
            
        }
        
    }
    
    //Reset state of calculator
    func reset(){
        currentOp = nil
        currentNumber = 0
        previousNumber = nil
        decimalPlace = 0
        
    }
     
    //Returns true if division by 0 could happen
    func checkForDivision() -> Bool{
        if currentOp!.isDivision && (currentNumber == nil && previousNumber == 0 || currentNumber == 0){
            displayValue = "Error"
            reset()
            return true
        }
        
        return false
    }
    
    func equalClicked(){
        //Check if we have an operation to perform
        if currentOp != nil{
            //Reset the decimal place for the curernt number
            decimalPlace = 0
            //Guard for division by 0
            if checkForDivision() {return}
            
            //Check if we have at least one operand
            if currentNumber != nil || previousNumber != nil{
                //Compute the total
                let total = currentOp!.op(previousNumber ?? currentNumber!, currentNumber ?? previousNumber!)
                
                //Update the first operand
                if currentNumber == nil{
                    currentNumber = previousNumber
                }
                
                //Update the second operand
            
                previousNumber = total
                
                //Set the equaled flag
                equaled = true
                
                //Update the UI
                setDisplayValue(number: total)
            }
        }
    }
    
    func decimalClicked(){
        //if equal was pressed, reset the current number
        if equaled {
            currentNumber = nil
            previousNumber = nil
            equaled = false
        }
        
        //if a "." was typed first, set the current number
        if currentNumber == nil{
            currentNumber = 0
        }
        
        //Set decimal place
        decimalPlace = 1
        
        //Update the UI
        setDisplayValue(number: currentNumber!)
        displayValue.append(".")
        
    }
    
    func numberPressed(value: Double){
        
        //If equal was pressed, clear the current number
        if equaled{
            currentNumber = 0
            previousNumber = nil
            equaled = false
        }
        
        //If there is no current number, set it to the value
        if currentNumber == nil{
            currentNumber = value / pow(10,decimalPlace)
        }else{
            //Other wise,add the value to the current number
            
            //If no decimal was typed, add the value as last digit of the number
            if decimalPlace == 0{
                currentNumber = currentNumber! * 10 + value
            }else{
                //Add the value to last decimal of number
                currentNumber = currentNumber! + value / pow(10,decimalPlace )
                decimalPlace += 1
            }
        }
        
        //Update the UI
        setDisplayValue(number: currentNumber!)
        
        
        
        
    }
    
    func operatorPressed(op: Operator){
        //Reset the decimal
        decimalPlace = 0
        
        //If equal was pressed, reset the current number
        if equaled{
            currentNumber = nil
            equaled = false
        }
        
        //If we have two operand, compute them
        if currentNumber != nil && previousNumber != nil{
            if checkForDivision() {return}
            let total = currentOp!.op(previousNumber!,currentNumber!)
            previousNumber = total
            currentNumber = nil
            
            //Update the UI
            setDisplayValue(number: total)
            
            //If only one number has been given, move it to the second operand
        }else if previousNumber == nil{
            previousNumber = currentNumber
            currentNumber = nil

        }
        
        currentOp = op
        
    
        
    }
    
}

func pow(_ base:Int,_ exp:Int) -> Double{
    return pow(Double(base), Double(exp))
}
