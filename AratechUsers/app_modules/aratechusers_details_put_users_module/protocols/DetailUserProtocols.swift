//
//  DetailUserProtocols.swift
//  AratechUsers
//
//  Created by Esther Huecas on 06/01/2021.
//

import Foundation

protocol PresenterToViewDetailUserProtocol: class {
    func getDetailUserSuccess(data: User)
    func getDetailUserError()
}

protocol InteractorToPresenterDetailUserProtocol: class {
    func getDetailUserFetched(data: User)
    func getDetailUserFailed()
}

protocol PresenterToInteractorDetailUserProtocol: class {
    var presenter: InteractorToPresenterDetailUserProtocol? {get set}
    func fetchDetailUser(id: String)
}

protocol ViewToPresenterDetailUserProtocol: class {
    var view: PresenterToViewDetailUserProtocol? {get set}
    var interactor: PresenterToInteractorDetailUserProtocol? {get set}
    var router: PresenterToRouterDetailUserProtocol? {get set}
    
    func getDetailUser(id: String)
}

protocol PresenterToRouterDetailUserProtocol: class {
    static func createModule() -> DetailUserViewController
}
