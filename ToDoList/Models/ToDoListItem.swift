//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Ying on 27/11/2023.
//

import Foundation

struct ToDoListItem: Codable, Identifiable{
    let id: String // uuid, not user id
    // make sure every item has its own id
    let title: String
    let dueDate: TimeInterval
    let createDate: TimeInterval
    var isDone: Bool
    
    // Mutating equals to Set() in java, used when you want to change a para value:
    // listItem.setDone(true)
    // _ means no need to clarify the para name when you call it
    mutating func setDone(_ state: Bool){
        isDone = state
    }
}
