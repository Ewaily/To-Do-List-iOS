//
//  TaskEdit.swift
//  To-Do List
//
//  Created by Muhammad Ewaily on 7/24/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import NotificationBannerSwift
import UIKit

class UpdatedTask: UIViewController {
    
    @IBOutlet private var todoTextField: UITextField!
    @IBOutlet private var todoSwitch: UISwitch!
    var editTextField = ""
    var editSwitch = false
    var editTask: TodoTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.save, target: self, action: #selector(saveButtonAction)), animated: true)
        updateEditDisplay()
    }
    
    @objc private func saveButtonAction() {
            editTextField = todoTextField.text!
            editSwitch = todoSwitch.isOn
            RealmData.editTask(task: editTask!, updatedText: editTextField, updatedStatus: editSwitch)
            navigationController?.popViewController(animated: true)
            showNotificationBannerSwift(bannerTitle: "Modified successfully!", bannerStyle: .success)
    }
    
    private func updateEditDisplay() {
        todoTextField.text = editTextField
        todoSwitch.setOn(editSwitch, animated: true)
    }
}



