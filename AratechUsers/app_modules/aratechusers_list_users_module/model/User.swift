//
//  User.swift
//  AratechUsers
//
//  Created by Esther Huecas on 05/01/2021.
//

import Foundation

struct User: Codable {
    public let id: String
    public var name: String
    public var birthdate: String
    
//    public init(id: Int){
//        self.id = id
//    }
    
    public init(id: String, name: String, birthdate: String) {
        self.id = id
        self.name = name
        self.birthdate = birthdate
    }
}
