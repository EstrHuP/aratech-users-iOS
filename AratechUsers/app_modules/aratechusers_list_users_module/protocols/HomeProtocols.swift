//
//  HomeProtocols.swift
//  AratechUsers
//
//  Created by Esther Huecas on 05/01/2021.
//

import Foundation
import UIKit

protocol PresenterToViewHomeProtocol: class {
    func showListUsersSuccess(object: [User])
    func showListUsersError()
}

protocol InteractorToPresenterHomeProtocol: class {
    func showListUsersFetched(object: [User])
    func showListUsersFailed()
}

protocol PresenterToInteractorHomeProtocol: class {
    var presenter: InteractorToPresenterHomeProtocol? {get set}
    func fetchListUsers()
}

protocol ViewToPresenterHomeProtocol: class {
    var view: PresenterToViewHomeProtocol? {get set}
    var interactor: PresenterToInteractorHomeProtocol? {get set}
    var router: PresenterToRouterHomeProtocol? {get set}
    
    func getListUsers()
}

protocol PresenterToRouterHomeProtocol: class {
    static func createModule() -> HomeViewController
}
