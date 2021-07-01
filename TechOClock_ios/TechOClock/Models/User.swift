//
//  User.swift
//  TechOClock
//
//  Created by ThiagoGarcia on 27/06/2021.
//

import Foundation

struct User : Codable{
    var nome : String
    var nif  : String
    var email : String
    
}

typealias Users = [User]

struct Registers: Codable {
    let users: [User]
}
