//
//  Todo.swift
//  TodoList
//
//  Created by Konstantin Loginov on 30.09.2021.
//

import Foundation

enum Priority {
    case low
    case medium
    case high
}

struct Todo: Equatable {
    let label: String
    let priority: Priority
    var isCheck: Bool
}
