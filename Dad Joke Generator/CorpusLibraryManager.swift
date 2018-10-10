//
//  CorpusLibraryManager.swift
//  Dad Joke Generator
//
//  Credit to: https://mikeash.com/pyblog/friday-qa-2018-04-27-generating-text-with-markov-chains-in-swift.html
//

import Foundation

class CorpusLibraryManager {
    
    let filename: String = "jokes"
    let documentsDirectory = try? FileManager.default.url(for: .documentDirectory,
                                           in: .userDomainMask, appropriateFor: nil, create: true)
    var corpusFilePath: URL?
    
    init() {
        
        if let libraryFileExpectedPath = documentsDirectory?.appendingPathComponent(filename).appendingPathExtension("txt") {
            corpusFilePath = libraryFileExpectedPath
            
            // Create a text file in the documents directory for the app if it doesn't exist
            if !doesCorpusFileExist() {
                createCorpusFile()
            }
        }
        
        print(documentsDirectory?.absoluteString)
    }
    
    func doesCorpusFileExist() -> Bool {
        if FileManager.default.fileExists(atPath: (corpusFilePath?.absoluteString)!) {
            return true
        }
        
        return false
    }
    
    func createCorpusFile() {
        if let filepath = Bundle.main.path(forResource: "jokes", ofType: "txt") {
            do {
                let contents = try String(contentsOfFile: filepath)
                
                //writing
                do {
                    try contents.write(to: corpusFilePath!, atomically: false, encoding: .utf8)
                }
                catch {/* error handling here */}
                
            } catch {
                print("File could not be written")
            }
        } else {
            print("File not found")
        }
    }
    
    func readCorpusFile() -> String {
        
        if corpusFilePath != nil {
            
            do {
                let fileString = try String(contentsOf: corpusFilePath!)
                
                return fileString
                
            } catch {
                print("Failed reading from URL: \(String(describing: corpusFilePath)), Error: " + error.localizedDescription)
            }
        }
        
        return "Couldn't load file"
        
    }
    
}
