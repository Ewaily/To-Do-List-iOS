//
//  ViewController.swift
//  To-Do List
//
//  Created by Muhammad Ewaily on 7/24/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import UIKit

class ListTableView: UIViewController {
    @IBOutlet weak var listTableView: UITableView!
    let todos = RealmData.retrieveTasks()
    var currentIndexPath = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        let taskXibFile = UINib(nibName: "TaskCell", bundle: nil)
        listTableView.register(taskXibFile, forCellReuseIdentifier: "taskCell")
        reload()
    }
    override func viewWillAppear(_ animated: Bool) {
        reload()
    }
    func reload() {
        listTableView.reloadData()
    }
}

extension ListTableView: UITableViewDelegate {
    
}

extension ListTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as! TaskCell
        let taskText = todos[indexPath.row].toDoText
        let taskStatus = todos[indexPath.row].isDone ? "It is done" : "Do it"
        cell.configureCell(Text: taskText, Status: taskStatus)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentIndexPath = indexPath.row
        performSegue(withIdentifier: "edit", sender: self)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "edit" {
            let editVC = segue.destination as! Task
            editVC.editStatus = true
            editVC.editTask = todos[currentIndexPath]
            editVC.editTextField = todos[currentIndexPath].toDoText
            editVC.editSwitch = todos[currentIndexPath].isDone
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            RealmData.deleteTask(task: todos[indexPath.row])
            reload()
        }
    }
}

