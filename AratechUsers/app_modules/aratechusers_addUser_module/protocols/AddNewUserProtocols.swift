//
//  AddNewUserProtocols.swift
//  AratechUsers
//
//  Created by Esther Huecas on 06/01/2021.
//

import Foundation
import UIKit

protocol PresenterToViewAddUserProtocol: class {
    func addUserSuccess()
    func addUserError()
}

protocol InteractorToPresenterAddUserProtocol: class {
    func addUserFetched()
    func addUserFailed()
}

protocol PresenterToInteractorAddUserProtocol: class {
    var presenter: InteractorToPresenterAddUserProtocol? {get set}
    func fetchAddNewUser(sendUser: User)
}

protocol PresenterToRouterAddUserProtocol: class {
    static func createModule() -> AddNewUserViewController
}

protocol ViewToPresenterAddUserProtocol: class {
    var view: PresenterToViewAddUserProtocol? {get set}
    var interactor: PresenterToInteractorAddUserProtocol? {get set}
    var router: PresenterToRouterAddUserProtocol? {get set}
    
    func postAddNewUser(sendUser: User)
}
