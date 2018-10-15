//
//  CachedJokesTableViewController.swift
//  Dad Joke Generator
//
//  Created by Eric Jorgensen on 10/14/18.
//  Copyright © 2018 Eric Jorgensen. All rights reserved.
//

import Foundation
import UIKit

public class CachedJokesTableViewController: UITableViewController {
    
    @IBAction func closeList(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var filePath: String?
    var jokes: [String] = []
    
    let jokesLibraryManager = JokesLibraryManager()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        jokes = jokesLibraryManager.jokesFromFile as! [String]
        
        // Load the jokes file for displaying
        jokesLibraryManager.loadJokesCacheFile()
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        
        // Reload the jokes file for displaying
        jokesLibraryManager.loadJokesCacheFile()
        
        jokes = jokesLibraryManager.jokesFromFile as! [String]
        
        self.tableView.reloadData()
        
    }
    
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (jokes.count)
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jokeCell", for: indexPath) as! JokeTableViewCell
        cell.jokeText.text = (jokes[indexPath.row]) //as! String)
        
        return cell
    }
}
