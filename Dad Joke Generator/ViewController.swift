//
//  ViewController.swift
//  Dad Joke Generator
//
//  Created by Eric Jorgensen on 10/8/18.
//  Copyright © 2018 Eric Jorgensen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var CorpusDisplay: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let corpusLibraryManager = CorpusLibraryManager()
        
        CorpusDisplay.text = corpusLibraryManager.readCorpusFile()
        
    }


}

