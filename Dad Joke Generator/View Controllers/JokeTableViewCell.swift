//
//  JokeTableViewCell.swift
//  Dad Joke Generator
//
//  Created by Eric Jorgensen on 10/14/18.
//  Copyright © 2018 Eric Jorgensen. All rights reserved.
//

import UIKit

class JokeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var jokeText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
