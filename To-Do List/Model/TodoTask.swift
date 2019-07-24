//
//  ToDo.swift
//  To-Do List
//
//  Created by Muhammad Ewaily on 7/24/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import Foundation
import RealmSwift

class TodoTask: Object {
    @objc dynamic var toDoText = ""
    @objc dynamic var isDone = false
}
