//
//  weatherButton.swift
//  Weather App
//
//  Created by Decagon on 07/02/2022.
//

import SwiftUI

struct WeatherButtonTextView: View {
    var buttonText: String
    var textColor: Color
    var backgroundColor: Color
    var body: some View{
        
        Text (buttonText)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
        
    }
}
