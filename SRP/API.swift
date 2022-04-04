//
//  API.swift
//  SRP
//
//  Created by Jeytery on 04.04.2022.
//

import Foundation

// Not SRP in file
// model and API in the same place

struct Joke {
    let name: String
    let body: String
}

typealias Jokes = [Joke]

typealias ResultCompletion<ReturType, ErrorType: Error> = (Result<ReturType, ErrorType>) -> Void

class API {
    static func getJokes(completion: @escaping ResultCompletion<Jokes, Error>) {
        let jokes: Jokes = [
            .init(name: "Bear joke", body: "I love bear"),
            .init(name: "Base programming joke", body: "Hello from world!"),
            .init(name: "Language joke", body: "C# is better than C++"),
            .init(name: "Absurd", body: "JS is the best programming language"),
            .init(name: "I so love this architecture", body: "VIPER is a good architecture"),
            .init(name: "My university joke", body: "KPI is the best place to learn code"),
            .init(name: "SLAVA", body: "A-ME-RI-KA"),
        ]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion(.success(jokes))
        }
    }
}
