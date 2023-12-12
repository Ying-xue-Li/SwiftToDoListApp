//
//  User.swift
//  ToDoList
//
//  Created by Ying on 27/11/2023.
//

import Foundation

struct User: Codable{
    let id: String
    let name: String
    let email: String
    let pswd: String
    let joined: TimeInterval
}
