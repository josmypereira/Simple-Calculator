//
//  CalculatorButton.swift
//  Calculator
//
//  Created by Josmy Pereira on October 13, 2024.
//

import SwiftUI

// A view representing a button for the calculator
struct CalculatorButton: View {
    var width: CGFloat = 70 // Default width of the button
    var color = Color(hue: 1.0, saturation: 0.0, brightness: 0.283) // Default background color of the button
    var buttonText = "1" // Default text displayed on the button
    var action: (CalculatorButton) -> Void = {_ in } // Action to be executed when the button is pressed
    var mode: CalculatorMode = .notSet // Mode associated with the button (e.g., operation mode)

    var body: some View {
        Button { // Button action when tapped
            action(self) // Execute the action with the current button instance
        } label: {
            Text(buttonText) // Text displayed on the button
                .font(.largeTitle) // Font style for the button text
                .frame(width: width, height: 70, alignment: .center) // Set button dimensions
                .background(color) // Background color of the button
                .foregroundColor(.white) // Text color of the button
                .clipShape(RoundedRectangle(cornerRadius: 15)) // Rounded corners for the button shape
        }

    }
	
}

// Preview provider for SwiftUI preview of CalculatorButton
struct CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButton() // Render the CalculatorButton view for preview
    }
}
