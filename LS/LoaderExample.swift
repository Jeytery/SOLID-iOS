//
//  LoaderExample.swift
//  LS
//
//  Created by Jeytery on 04.04.2022.
//

import Foundation

// All your protocols should work equally for all implementaions

protocol AnimalLoader {
    func load(completion: @escaping (Any) -> Void)
}

struct Animal {
    let name: String
    let age: Int
}

typealias Animals = [Animal]

// [!] return animals as array

class NetworkAnimalLoader: AnimalLoader {
    func load(completion: @escaping (Any) -> Void) {
        // get animals from database
        let animals: Animals = [
            .init(name: "Ben", age: 4),
            .init(name: "Tom", age: 6),
            .init(name: "Roman", age: 10)
        ]
        completion(animals)
    }
}

// [!] return animals as dictionary

class PhoneStorageAnimalLoader: AnimalLoader {
    func load(completion: @escaping (Any) -> Void) {
        // get animals from phone storage
        let animalDictionary: [String: Animal] = [
            "dog": Animal(name: "Ben", age: 4),
            "cat": Animal(name: "Tom", age: 6),
            "Giraffe": Animal(name: "Roman", age: 10)
        ]
        completion(animalDictionary)
    }
}

// by LS you should create protocol in unambiguous way.

protocol LSLoader {
    func load(completion: @escaping (Animals) -> Void)
}

// this is very dumb situation, but it is only to show the main ideo of LS principle 
