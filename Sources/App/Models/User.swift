//
//  User.swift
//  
//
//  Created by Сергей Дарьин on 24.03.2024.
//

import Fluent
import Vapor

final class User: Model, Content {
    static let schema = "users"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
//    @Field(key: "age")
//    var age: Int
    
    
    init() {}
    
    init(id: UUID? = nil, name: String) {
        self.id = id
        self.name = name
//        self.age = age
    }
}

