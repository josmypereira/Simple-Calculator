//
//  ContentView.swift
//  Calculator
//
//  Created by Josmy Pereira on October 13, 2024.
//

import SwiftUI

// Main view for the Calculator app
struct ContentView: View {
    @State var currentValue: String = "0" // State variable to hold the current displayed value

    var body: some View {
        ZStack { // Layering views on top of each other
            Color.black // Background color of the calculator
            VStack { // Vertical stack to arrange elements
                TotalText(value: currentValue) // Displays the current total value
                ButtonGrid(currentValue: $currentValue) // Grid of calculator buttons
            }
        }
        .padding() // Add padding around the ZStack
    }
}

// Preview provider for SwiftUI preview of ContentView
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView() // Render the ContentView for preview
    }
}
