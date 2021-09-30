//
//  TodoCell.swift
//  TodoList
//
//  Created by Konstantin Loginov on 30.09.2021.
//

import UIKit

class TodoCell: UITableViewCell {
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var todoLabel: UILabel!
    
    @IBAction func onCheckClicked(_ sender: Any) {
        delegate?.checked(todo)
    }
    
    
    static let identifier = "TodoCell"
    static let nib = UINib(nibName: identifier, bundle: Bundle.main)
    
    private var todo: Todo?
    private weak var delegate: TodoListDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        checkButton.tintColor = UIColor.red
    }
    
    func set(_ todo: Todo, delegate: TodoListDelegate) {
        self.todo = todo
        self.delegate = delegate
        
        checkButton.setImage(UIImage(systemName: todo.isCheck ? "checkmark.circle.fill" : "circle"),
                             for: .normal)
        todoLabel.text = todo.label
        switch todo.priority {
        case .high:
            backgroundColor = UIColor.red.withAlphaComponent(0.12)
        case .medium:
            backgroundColor = UIColor.yellow.withAlphaComponent(0.12)
        case .low:
            backgroundColor = UIColor.green.withAlphaComponent(0.12)
        }
    }
    
}
