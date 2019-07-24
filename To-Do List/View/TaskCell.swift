//
//  TaskCell.swift
//  To-Do List
//
//  Created by Muhammad Ewaily on 7/24/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var todoText: UILabel!
    @IBOutlet weak var isDoneText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(Text: String, Status: String) {
        todoText.text = Text
        isDoneText.text = Status
    }
    
}
