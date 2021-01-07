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
    func putDetailUserSuccess(putData: User)
    func putDetailUserError()
}

protocol InteractorToPresenterDetailUserProtocol: class {
    func getDetailUserFetched(data: User)
    func getDetailUserFailed()
    func putDetailUserFetched(putData: User)
    func putDetailUserError()
}

protocol PresenterToInteractorDetailUserProtocol: class {
    var presenter: InteractorToPresenterDetailUserProtocol? {get set}
    func fetchDetailUser(id: String)
    func fetchPutDetailUser(id: String)
}

protocol ViewToPresenterDetailUserProtocol: class {
    var view: PresenterToViewDetailUserProtocol? {get set}
    var interactor: PresenterToInteractorDetailUserProtocol? {get set}
    var router: PresenterToRouterDetailUserProtocol? {get set}
    
    func getDetailUser(id: String)
    func putDetailUser(id: String)
}

protocol PresenterToRouterDetailUserProtocol: class {
    static func createModule() -> DetailUserViewController
}
