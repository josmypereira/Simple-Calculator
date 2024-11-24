//
//  TotalText.swift
//  Calculator
//
//  Created by Josmy Pereira on October 13, 2024.
//

import SwiftUI

// A view for displaying the total value in the calculator
struct TotalText: View {
    var value = "0" // Default value to be displayed

    var body: some View {
        Text(value) // Create a Text view with the current value
            .font(.system(size: 60)) // Set the font size
            .foregroundColor(.white) // Set the text color to white
            .fontWeight(.light) // Use light font weight
            .padding() // Add padding around the text
            .frame(width: 300, alignment: .trailing) // Set the frame width and alignment
            .lineLimit(1) // Limit the text to a single line
    }
}

// Preview provider for SwiftUI preview of TotalText
struct TotalText_Previews: PreviewProvider {
    static var previews: some View {
        TotalText() // Render the TotalText view for preview with a background
            .background(.black) // Set the background color to black for the preview
    }
}
