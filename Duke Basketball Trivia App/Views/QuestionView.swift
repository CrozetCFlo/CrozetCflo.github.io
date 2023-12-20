//
//  QuestionView.swift
//  Duke Basketball Trivia App
//
//  Created by Chris Florez on 12/18/23.
//

import SwiftUI

struct QuestionView: View {
    var body: some View {
        VStack(spacing: 40){
            HStack {
                Text("Duke Basketball Trivia")
                    .title()
                
                Spacer()
                
                Text("1 of 10")
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.bold)
            }
            
            ProgressBar(progress: 40)
            
            VStack(alignment: .leading, spacing: 20){
                Text("Duke won its last National Championship in 2018.")
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(Color("AccentColor"))
                
                AnswerRow(answer: Answer(text: "False" ,
                          iscorrect: true))
                AnswerRow(answer: Answer(text: "True" ,
                          iscorrect: false))
                                         
            }
            PrimaryButton(text: "Next")
            
            Spacer()
        }
        
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarHidden(true)
            .onAppear {
                AudioState.shared.stopAudio()
            }
        }
    
    struct QuestionView_Previews: PreviewProvider {
        static var previews: some View {
            QuestionView()
        }
    }
    }
