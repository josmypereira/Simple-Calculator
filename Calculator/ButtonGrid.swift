//
//  ButtonGrid.swift
//  Calculator
//
//  Created by Josmy Pereira on October 13, 2024.
//

import SwiftUI

// Enum to represent the current calculator mode
enum CalculatorMode {
    case notSet // No operation selected
    case addition // Addition operation
    case subtraction // Subtraction operation
    case multiplication // Multiplication operation
}

struct ButtonGrid: View {
    // Binding variable to hold the current value displayed
    @Binding var currentValue: String
    // State variable to keep track of the current operation mode
    @State var currentMode: CalculatorMode = .notSet
    // State variable to determine if the last button pressed was an operation mode
    @State var lastButtonWasMode = false

    var body: some View {
        // Create a grid layout for the calculator buttons
        Grid {
            // First row of buttons
            GridRow {
                CalculatorButton(buttonText: "1", action: numberWasPressed)
                CalculatorButton(buttonText: "2", action: numberWasPressed)
                CalculatorButton(buttonText: "3", action: numberWasPressed)
                CalculatorButton(color: .orange, buttonText: "+", action: modeWasPressed, mode: .addition)
            }
            // Second row of buttons
            GridRow {
                CalculatorButton(buttonText: "4", action: numberWasPressed)
                CalculatorButton(buttonText: "5", action: numberWasPressed)
                CalculatorButton(buttonText: "6", action: numberWasPressed)
                CalculatorButton(color: .orange, buttonText: "-", action: modeWasPressed, mode: .subtraction)
            }
            // Third row of buttons
            GridRow {
                CalculatorButton(buttonText: "7", action: numberWasPressed)
                CalculatorButton(buttonText: "8", action: numberWasPressed)
                CalculatorButton(buttonText: "9", action: numberWasPressed)
                CalculatorButton(color: .orange, buttonText: "X", action: modeWasPressed, mode: .multiplication)
            }
            // Fourth row of buttons, including zero and action buttons
            GridRow {
                CalculatorButton(width: 148, buttonText: "0", action: numberWasPressed)
                    .gridCellColumns(2) // Makes the 0 button span two columns
                CalculatorButton(color: .gray, buttonText: "C", action: clearWasPressed) // Clear button
                CalculatorButton(color: .orange, buttonText: "=", action: equalWasPressed) // Equals button
            }
        }
		
    }
    
    // Action for number buttons
    func numberWasPressed(button: CalculatorButton) {
        if lastButtonWasMode { // Check if the last button pressed was a mode
            lastButtonWasMode = false // Reset the mode flag
        }
        // Try to concatenate the current value with the pressed button's text
        if let currentValueInt = Int(currentValue + button.buttonText) {
            currentValue = "\(currentValueInt)" // Update the current value
        } else {
            currentValue = "Error" // Handle conversion failure
        }
    }
    
    // Action for operation mode buttons
    func modeWasPressed(button: CalculatorButton) {
        currentMode = button.mode // Set the current operation mode
        lastButtonWasMode = true // Update the flag indicating a mode was pressed
    }
    
    // Action for the clear button
    func clearWasPressed(button: CalculatorButton) {
        print("clear was pressed") // Placeholder for clear functionality
    }
    
    // Action for the equals button
    func equalWasPressed(button: CalculatorButton) {
        if currentMode == .notSet || lastButtonWasMode {
            return // Do nothing if no operation is set or last button was a mode
        }
        // Further logic for calculating the result would go here
    }

}

// Preview provider for SwiftUI preview
struct ButtonGrid_Previews: PreviewProvider {
    @State static var currentValue = "1" // Initial value for the preview
    static var previews: some View {
        ButtonGrid(currentValue: $currentValue) // Render the ButtonGrid view
    }
}
