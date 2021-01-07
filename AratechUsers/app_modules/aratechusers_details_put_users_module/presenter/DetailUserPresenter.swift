//
//  DetailUserPresenter.swift
//  AratechUsers
//
//  Created by Esther Huecas on 06/01/2021.
//

import Foundation

class DetailUserPresenter: ViewToPresenterDetailUserProtocol {
    
    var view: PresenterToViewDetailUserProtocol?
    var interactor: PresenterToInteractorDetailUserProtocol?
    var router: PresenterToRouterDetailUserProtocol?
    
    func getDetailUser(id: String) {
        interactor?.fetchDetailUser(id: id)
    }
    
    func putDetailUser(id: String) {
        interactor?.fetchPutDetailUser(id: id)
    }
}

extension DetailUserPresenter: InteractorToPresenterDetailUserProtocol {
    func getDetailUserFetched(data: User) {
        view?.getDetailUserSuccess(data: data)
    }
    
    func getDetailUserFailed() {
        view?.getDetailUserError()
    }
    
    func putDetailUserFetched(putData: User) {
        view?.putDetailUserSuccess(putData: putData)
    }
    
    func putDetailUserError() {
        view?.putDetailUserError()
    }
}
