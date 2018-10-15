//
//  Word.swift
//  Dad Joke Generator
//
//  Credit to: https://mikeash.com/pyblog/friday-qa-2018-04-27-generating-text-with-markov-chains-in-swift.html
//

import Foundation

class Word {
    let str: String?
    var links: [Word] = []
    
    init(str: String?) {
        self.str = str
    }
    
    func randomNext() -> Word {
        let index = arc4random_uniform(UInt32(links.count))
        return links[Int(index)]
    }
}
