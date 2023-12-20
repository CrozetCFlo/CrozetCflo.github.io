//
//  Trivia.swift
//  Duke Basketball Trivia App
//
//  Created by Chris Florez on 12/19/23.
//

import Foundation

// Function to generate multiple-choice questions using OpenAI API
func generateQuestions(prompt: String, completion: @escaping (String?) -> Void) {
    let apiKey = "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"
    let endpoint = "https://api.openai.com/v1/engines/davinci-codex/completions"

    guard let url = URL(string: endpoint) else {
        print("Invalid URL")
        completion(nil)
        return
    }

    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")

    let requestData: [String: Any] = [
        "prompt": prompt,
        "max_tokens": 150
    ]

    guard let jsonData = try? JSONSerialization.data(withJSONObject: requestData) else {
        print("Failed to serialize JSON data")
        completion(nil)
        return
    }

    request.httpBody = jsonData

    URLSession.shared.dataTask(with: request) { data, _, error in
        if let error = error {
            print("Error: \(error.localizedDescription)")
            completion(nil)
            return
        }

        if let data = data,
           let responseString = String(data: data, encoding: .utf8) {
            completion(responseString)
        } else {
            print("Invalid response data")
            completion(nil)
        }
    }.resume()
}

// Example usage
let prompt = "Generate multiple-choice questions about Duke men's basketball."
generateQuestions(prompt: prompt) { response in
    if let response = response {
        print(response)
    } else {
        print("Failed to generate questions")
    }
}



