//
//  JokesLibraryManager.swift
//  Dad Joke Generator
//

import Foundation

class JokesLibraryManager {
    
    // The filename to which we'll save our jokes for caching purposes
    let filename: String = "saved_jokes"
    
    // Our app's documents directory
    let documentsDirectory = try? FileManager.default.url(for: .documentDirectory,
                                                          in: .userDomainMask, appropriateFor: nil, create: true)
    
    // URL to where we'll eventually save our file
    var jokesFilePath: URL?
    
    var jokesFromFile: Array<String>?

    
    init() {
        
        if let jokesFileExpectedPath = documentsDirectory?.appendingPathComponent(filename).appendingPathExtension("plist") {
            jokesFilePath = jokesFileExpectedPath
            
            // Create a plist file in the documents directory for the app if it doesn't exist
            if !doesJokesCacheFileExist() {
                createEmptyCacheFile()
            }
            
            loadJokesCacheFile()
        }
    }
    
    func doesJokesCacheFileExist() -> Bool {
        
        do {
            try jokesFilePath?.checkResourceIsReachable()
            
            return true
            
        } catch let error as NSError {
            print(error)
        }
        return false
    }
    
    func createEmptyCacheFile() {
        let dataToWrite = [
            "This is a sample joke. Not very funny, huh?"
        ]
        
        // Looks like Array doesn't have a write method, so let's cast to NSArray
        (dataToWrite as NSArray).write(to: jokesFilePath!, atomically: true)
    }
    
    func loadJokesCacheFile() {
        let savedJokesData = try! Data(contentsOf: jokesFilePath!)
        jokesFromFile = try! PropertyListSerialization.propertyList(from: savedJokesData, options: [], format: nil) as! Array<String>
    }
    
    func insertJokeIntoFile(newJoke: String) {
        
        jokesFromFile!.append(newJoke)
        
        (jokesFromFile! as NSArray).write(to: jokesFilePath!, atomically: true)
    }
    
}
