//
//  ToDoListTableViewCell.swift
//  To-Do-List
//
//  Created by Paige Plander on 2/18/16.
//  Copyright © 2016 Paige Plander. All rights reserved.
//

import UIKit

class ToDoListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var checkmarkView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
