//
//  Extensions.swift
//  Duke Basketball Trivia App
//
//  Created by Chris Florez on 12/18/23.
//

import Foundation
import SwiftUI

extension Text {
    func title () -> some View {
        self .font(.title)
            .fontWeight(.bold)
            .foregroundColor(Color("AccentColor"))
    }
}
