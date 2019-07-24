//
//  TaskEdit.swift
//  To-Do List
//
//  Created by Muhammad Ewaily on 7/24/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import UIKit

class Task: UIViewController {

    @IBOutlet weak var todoTextField: UITextField!
    @IBOutlet weak var todoSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.save, target: self, action: #selector(saveButtonAction)), animated: true)
    }
    
    @objc func saveButtonAction() {
        RealmData.addTasks(text: todoTextField.text!, isDoneSwitch: todoSwitch.isOn)
        navigationController?.popViewController(animated: true)
    }
    
    
}

