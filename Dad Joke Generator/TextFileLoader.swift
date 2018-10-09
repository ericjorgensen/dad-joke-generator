//
//  TextFileLoader.swift
//  Dad Joke Generator
//
//  Credit to: https://mikeash.com/pyblog/friday-qa-2018-04-27-generating-text-with-markov-chains-in-swift.html
//

import Foundation

class TextFileLoader {
    
    var filename: String = "jokes.txt"
    
    func readTextFile() -> String {
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let fileURL = dir.appendingPathComponent(filename)
        
            do {
                let fileContents = try String(contentsOf: fileURL, encoding: .utf8)
                
                return fileContents
            }
            catch {
                return "Couldn't load file"
            }
        }
        
        return "Couldn't load directory"
    }
}
