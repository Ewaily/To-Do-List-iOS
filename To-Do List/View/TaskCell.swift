//
//  TaskCell.swift
//  To-Do List
//
//  Created by Muhammad Ewaily on 7/24/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import IBAnimatable
import UIKit

class TaskCell: UITableViewCell {
    
    @IBOutlet private var todoText: UILabel!
    @IBOutlet private var isDoneButton: UIButton!
    @IBOutlet private var taskContentView: AnimatableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(text: String, status: Bool) {
        todoText.text = text
        if status {
            isDoneButton.setImage(#imageLiteral(resourceName: "Checkedbox"), for: .normal)
        }
        else {
            isDoneButton.setImage(#imageLiteral(resourceName: "Uncheckedbox"), for: .normal)
        }
    }
}
