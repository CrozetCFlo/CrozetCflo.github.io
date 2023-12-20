import SwiftUI
import AVFoundation

struct TriviaGameView: View {
    @State private var question: String = ""
    @State private var choices: [String] = []
    @State private var selectedAnswer: String?
    @State private var isCorrectAnswer: Bool = false
    @State private var score: Int = 0

    var body: some View {
        VStack {
            Text(question)
                .padding()

            ForEach(choices, id: \.self) { choice in
                Button(action: {
                    selectedAnswer = choice
                    checkAnswer()
                }) {
                    Text(choice)
                }
                .disabled(selectedAnswer != nil)
            }

            Text("Score: \(score)")
        }
        .onAppear {
            fetchTriviaQuestion()
        }
    }

    func fetchTriviaQuestion() {
        // Make a network request to OpenAI API to get a trivia question
        // Update 'question' and 'choices' based on the API response
    }

    func checkAnswer() {
        // Make a network request to OpenAI API to check the answer
        // Update 'isCorrectAnswer' and 'score' based on the API response
        // Optionally, play audio feedback
    }
}
