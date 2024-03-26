//
//  CreateUsers.swift
//
//
//  Created by Сергей Дарьин on 24.03.2024.
//

import Fluent

struct CreateUsers: Migration {
    func prepare(on database: any FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        return database.schema("users")
            .id()
            .field("name", .string, .required)
            .create()
    }
    
    func revert(on database: any FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        return database.schema("users").delete()
    }
}
