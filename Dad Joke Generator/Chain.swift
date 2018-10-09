//
//  Chain.swift
//  Dad Joke Generator
//
//  Credit to: https://mikeash.com/pyblog/friday-qa-2018-04-27-generating-text-with-markov-chains-in-swift.html
//

import Foundation

class Chain {
    var words: [String?: Word] = [:]

    deinit {
        for word in words.values {
            word.links = []
        }
    }

    func add(_ words: [String]) {
        if words.isEmpty { return }

        let words = words as [String?]

        let wordPairs = zip([nil] + words, words + [nil])
        
        for (first, second) in wordPairs {

            let firstWord = word(first)
            let secondWord = word(second)

            firstWord.links.append(secondWord)
        }
    }

    func word(_ str: String?) -> Word {
        if let word = words[str] {
            return word
        } else {
            let word = Word(str: str)
            words[str] = word
            return word
        }
    }

    func generate() -> [String] {

        var result: [String] = []

        while true {

            let currentWord = word(result.last)
            let nextWord = currentWord.randomNext()
            
            if let str = nextWord.str {
                result.append(str)
            } else {
                break
            }
        }

        return result
    }
}
