//
//  ViewController.swift
//  Dad Joke Generator
//
//  Created by Eric Jorgensen on 10/8/18.
//  Copyright © 2018 Eric Jorgensen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Making sure that we have a corpus of text to use for our generator
    let corpusLibraryManager = CorpusLibraryManager()
    
    // Set up our Markov chain generator components
    let chain = Chain()
    let stringSplitter = StringSplitter()
    
    // Set up our local cache manager object for the jokes we generate
    let jokesLibraryManager = JokesLibraryManager()
    
    
    // Action attached to our Generate button
    @IBAction func generateDadJoke(_ sender: Any) {
        
        let joke = self.chain.generate().joined(separator: " ")
        
        
        let alert = UIAlertController(title: "A New Dad Joke", message: joke, preferredStyle: UIAlertController.Style.alert)
        
        // Add an action (button)
        alert.addAction(UIAlertAction(title: "Save Joke", style: UIAlertAction.Style.default, handler: { action in self.jokesLibraryManager.insertJokeIntoFile(newJoke: joke) }))
        alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: nil))
        
        // Show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Load our corpus into an array of sentences
        let corpusArray = corpusLibraryManager.readCorpusFile().components(separatedBy: .newlines)
        
        // Iterate through the corpus to build a chain that we'll use for our generator
        for str in corpusArray {
            for sentence in stringSplitter.wordSequences(in: str) {
                chain.add(sentence)
            }
        }
    
    }


}

