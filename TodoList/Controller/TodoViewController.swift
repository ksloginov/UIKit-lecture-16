//
//  ViewController.swift
//  TodoList
//
//  Created by Konstantin Loginov on 30.09.2021.
//

import UIKit

protocol TodoListDelegate: AnyObject {
    func checked(_ todo: Todo?)
}

class TodoViewController: UITableViewController, TodoListDelegate {
    
    func checked(_ todo: Todo?) {
        guard let todo = todo else { return }
        
        if let index = todos.firstIndex(of: todo) {
            todos[index].isCheck.toggle()
            tableView.reloadData()
        }
    }
    

    var todos = [
        Todo(label: "Update Xcode", priority: .high, isCheck: false),
        Todo(label: "Join Square", priority: .medium, isCheck: false),
        Todo(label: "Pay taxes", priority: .medium, isCheck: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "TODOs"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(TodoCell.nib, forCellReuseIdentifier: TodoCell.identifier)
        // Do any additional setup after loading the view.
    }
}

extension TodoViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return todos.count
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 50.0
        }
        
        return 0.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TodoCell.identifier, for: indexPath)
            (cell as? TodoCell)?.set(todos[indexPath.row],
                                     delegate: self)
            return cell
        }
        
        fatalError("No cell matching index found")
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "openDetails", sender: self)
        // Here, we still have indexPathForSelectedRow
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openDetails" {
            guard let row = tableView.indexPathForSelectedRow?.row else {
                return
            }
            
            (segue.destination as? DetailsViewController)?.todo = todos[row]
        }
    }
}
