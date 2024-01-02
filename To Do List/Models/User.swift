//
//  User.swift
//  To Do List
//
//  Created by Akash Gamage on 2024-01-01.
//

import Foundation

struct User: Codable {
    let id: String
    let uname: String
    let email: String
    let joined: TimeInterval
}
