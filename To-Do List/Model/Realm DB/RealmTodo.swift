//
//  RealmTodo.swift
//  To-Do List
//
//  Created by Muhammad Ewaily on 7/24/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import Foundation
import RealmSwift


class RealmData: Object {
    
     class func addTasks (text: String, isDoneSwitch: Bool) {
        let realm = try! Realm()
        try! realm.write {
            let todo = TodoTask()
            todo.toDoText = text
            todo.isDone = isDoneSwitch
            realm.add(todo)
        }
        print(Realm.Configuration.defaultConfiguration.fileURL!)

    }
    
     class func retriveTasks() -> Results<TodoTask>{
        let realm = try! Realm()
        let tasks = realm.objects(TodoTask.self)
        return tasks
    }
}
