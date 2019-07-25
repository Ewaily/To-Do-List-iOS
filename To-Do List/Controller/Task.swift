//
//  TaskEdit.swift
//  To-Do List
//
//  Created by Muhammad Ewaily on 7/24/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import NotificationBannerSwift
import UIKit

class Task: UIViewController {
    
    @IBOutlet var todoTextField: UITextField!
    @IBOutlet var todoSwitch: UISwitch!
    var editStatus = false
    var editTextField = ""
    var editSwitch = false
    var editTask: TodoTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.save, target: self, action: #selector(saveButtonAction)), animated: true)
        if editStatus {
            updateEditDisplay()
        }
    }
    
    @objc func saveButtonAction() {
        if editStatus {
            editTextField = todoTextField.text!
            editSwitch = todoSwitch.isOn
            RealmData.editTask(task: editTask!, updatedText: editTextField, updatedStatus: editSwitch)
            navigationController?.popViewController(animated: true)
            
            let banner = StatusBarNotificationBanner(title: "Modified successfully!", style: .success)
            banner.show()
        }
        else {
            RealmData.addTask(text: todoTextField.text!, isDoneSwitch: todoSwitch.isOn)
            navigationController?.popViewController(animated: true)
            let banner = StatusBarNotificationBanner(title: "Task added!", style: .success)
            banner.show()
        }
    }
    
    func updateEditDisplay() {
        todoTextField.text = editTextField
        todoSwitch.setOn(editSwitch, animated: true)
    }
}

