//
//  JokesLocalLibrary.swift
//  Dad Joke Generator
//
//  Credit to: https://mikeash.com/pyblog/friday-qa-2018-04-27-generating-text-with-markov-chains-in-swift.html
//

import Foundation

class JokesLocalLibrary {
    
    let filename: String = "jokes"
    
    let dir = try? FileManager.default.url(for: .documentDirectory,
                                           in: .userDomainMask, appropriateFor: nil, create: true)
    
    func doesJokesFileExist() -> Bool {
        if let fileURL = dir?.appendingPathComponent(filename).appendingPathExtension("txt") {
            return true
        }
    }
    
    func readJokesFile() -> String {
        
        if let fileURL = dir?.appendingPathComponent(filename).appendingPathExtension("txt") {
            do {
                let fileString = try String(contentsOf: fileURL)
                
                return fileString
                
            } catch {
                print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
            }
        }
        
        return "Couldn't load file"
        
    }
    
    func writeJokesFile() {
        
    }
    
}
