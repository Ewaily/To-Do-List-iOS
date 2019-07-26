//
//  TaskEdit.swift
//  To-Do List
//
//  Created by Muhammad Ewaily on 7/24/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import NotificationBannerSwift
import UIKit

class NewTask: UIViewController {
    
    @IBOutlet weak var todoTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.save, target: self, action: #selector(saveButtonAction)), animated: true)
    }
    
    @objc private func saveButtonAction() {
        RealmData.addTask(text: todoTextField.text!)
        navigationController?.popViewController(animated: true)
        showNotificationBannerSwift(bannerTitle: "Task added!", bannerStyle: .success)
    }
}

