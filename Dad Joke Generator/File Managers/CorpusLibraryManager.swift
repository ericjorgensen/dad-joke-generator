//
//  CorpusLibraryManager.swift
//  Dad Joke Generator
//
//  Credit to: https://mikeash.com/pyblog/friday-qa-2018-04-27-generating-text-with-markov-chains-in-swift.html
//

import Foundation

class CorpusLibraryManager {
    
    // The filename we'll save our corpus as
    let filename: String = "jokes"
    
    // Our app's documents directory
    let documentsDirectory = try? FileManager.default.url(for: .documentDirectory,
                                           in: .userDomainMask, appropriateFor: nil, create: true)
    
    // URL to where we'll eventually save our file
    var corpusFilePath: URL?
    
    init() {
        
        if let libraryFileExpectedPath = documentsDirectory?.appendingPathComponent(filename).appendingPathExtension("txt") {
            corpusFilePath = libraryFileExpectedPath
            
            // Create a text file in the documents directory for the app if it doesn't exist
            if !doesCorpusFileExist() {
                requestDadJokesForCorpus()
            }
        }
        
        // Helpful for local debugging
        print(documentsDirectory?.absoluteString ?? "No directory information available")
    }
    
    func doesCorpusFileExist() -> Bool {
        if FileManager.default.fileExists(atPath: (corpusFilePath?.absoluteString)!) {
            return true
        }
        
        return false
    }
    
    func createCorpusFile(contents: String) {

        //writing
        do {
            try contents.write(to: corpusFilePath!, atomically: false, encoding: .utf8)
        }
        catch {/* error handling here */}
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

    func requestDadJokesForCorpus() {
        
        let urlPath = "https://icanhazdadjoke.com/search?limit=30&page=1"
        let url = URL(string: urlPath)
        let session = URLSession.shared
        let request = NSMutableURLRequest(url: url!)
        
        request.httpMethod = "GET"
        request.addValue("text/plain", forHTTPHeaderField: "Accept")
        request.addValue("Eric Jorgensen's Dad Joke Generator (https://github.com/ericjorgensen/dad-joke-generator) ", forHTTPHeaderField: "User-Agent")
        let task = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                print(error!)
            } else {
                self.handleDadJokesFromRequest(requestData: String(data: data!, encoding: .utf8) ?? "No data received")
            }
        })
        
        task.resume()
    }
    
    func handleDadJokesFromRequest(requestData: String) {
        createCorpusFile(contents: requestData)
    }
    
}
