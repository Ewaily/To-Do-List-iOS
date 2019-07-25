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
    
    class func addTask(text: String, isDoneSwitch: Bool) {
        
        let realm = try! Realm()
        try! realm.write {
            let todo = TodoTask()
            todo.id = incrementID()
            todo.toDoText = text
            todo.isDone = isDoneSwitch
            realm.add(todo, update: .modified)
        }
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        func incrementID() -> Int {
            let realm = try! Realm()
            return Int((realm.objects(TodoTask.self).max(ofProperty: "id") as Int? ?? 0) + 1)
        }
    }
    
    class func editTask(task: TodoTask, updatedText: String, updatedStatus: Bool) {
        
        let realm = try! Realm()
        try! realm.write {
            task.toDoText = updatedText
            task.isDone = updatedStatus
        }
    }
    
    class func editTask(task: TodoTask, updatedStatus: Bool) {
        
        let realm = try! Realm()
        try! realm.write {
            task.isDone = updatedStatus
        }
    }
    
    class func retrieveTasks() -> Results<TodoTask> {
        
        let realm = try! Realm()
        let tasks = realm.objects(TodoTask.self)
        return tasks
    }
    
    class func deleteTask(task: TodoTask) {
        
        let realm = try! Realm()
        try! realm.write {
            realm.delete(task)
        }
    }
}
