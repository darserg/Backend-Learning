//
//  UserController.swift
//
//
//  Created by Сергей Дарьин on 24.03.2024.
//

import Fluent
import Vapor

struct UserController: RouteCollection {
    func boot(routes: any Vapor.RoutesBuilder) throws {
        let users = routes.grouped("users")
        users.get(use: index)
        users.post(use: create)
    }
    
    
    // /song route GET
    func index(req: Request) throws -> EventLoopFuture<[User]> {
        return User.query(on: req.db).all()
    }
    
    // /song route POST
    func create(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let user = try req.content.decode(User.self)
        return user.save(on: req.db).transform(to: .ok)
    }
}
