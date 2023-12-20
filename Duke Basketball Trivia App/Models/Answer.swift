//
//  Answer.swift
//  Duke Basketball Trivia App
//
//  Created by Chris Florez on 12/18/23.
//

import Foundation

struct Answer: Identifiable {
    var id = UUID()
    var text: AttributedString
    var iscorrect: Bool
}

