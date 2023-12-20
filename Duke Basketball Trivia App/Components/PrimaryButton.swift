//
//  PrimaryButton.swift
//  Duke Basketball Trivia App
//
//  Created by Chris Florez on 12/18/23.
//

import SwiftUI

struct PrimaryButton: View {
    var text: String
    var background: Color = Color("AccentColor")
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .padding()
            .fontWeight(.bold)
            .padding(.horizontal)
            .background(background)
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(text: "Let's Go, Duke!")
    }
}
