//
//  StringSplitter.swift
//  Dad Joke Generator
//
//  Credit to: https://mikeash.com/pyblog/friday-qa-2018-04-27-generating-text-with-markov-chains-in-swift.html
//

import Foundation

class StringSplitter {
    
    func wordSequences(in str: String) -> [[String]] {
        var result: [[String]] = []
        
        str.enumerateSubstrings(in: str.startIndex..., options: .bySentences, { substring, substringRange, enclosingRange, stop in
        
            let words = substring!.split(separator: " ").map({
                $0.trimmingCharacters(in: CharacterSet.newlines)
            })
            
            result.append(words)
        })
        
        return result
    }
}
