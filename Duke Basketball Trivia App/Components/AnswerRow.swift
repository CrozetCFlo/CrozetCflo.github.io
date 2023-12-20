//
//  AnswerRow.swift
//  Duke Basketball Trivia App
//
//  Created by Chris Florez on 12/18/23.
//

import SwiftUI

struct AnswerRow: View {
    var answer: Answer
    @State private var isSelected = false
    
    var green = Color(hue: 0.4, saturation: 0.7, brightness: 0.7)
    var red = Color(red: 0.7, green: 0.09, blue: 0.1)
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "circle.fill")
                .font(.caption)
            Text(answer.text)
                .bold()
            
            if isSelected {
                Spacer()
                
                Image(systemName: answer.iscorrect ?
                      "checkmark.circle.fill" :
                        "x.circle,fill")
                .foregroundColor(answer.iscorrect ?
                                 green : red)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(isSelected ?
                         Color("AccentColor") : .gray)
        .background(.white)
        .cornerRadius(10)
        .shadow(color: isSelected ? (answer.iscorrect ?
                green : red) : .gray, radius: 5, x: 0.5, y: 0.5)
        .onTapGesture {
            isSelected = true
        }
    }
}
    
    struct AnswerRow_Previews: PreviewProvider {
        static var previews: some View {
            AnswerRow(answer: Answer(text: "Single",
                                     iscorrect: false))
        }
    }
