//
//  HomePresenter.swift
//  AratechUsers
//
//  Created by Esther Huecas on 05/01/2021.
//

import Foundation
import UIKit

class HomePresenter: ViewToPresenterHomeProtocol {
    
    var view: PresenterToViewHomeProtocol?
    var interactor: PresenterToInteractorHomeProtocol?
    var router: PresenterToRouterHomeProtocol?
    
    func getListUsers() {
        interactor?.fetchListUsers()
    }
}

extension HomePresenter: InteractorToPresenterHomeProtocol {
    func showListUsersFetched(object: [User]) {
        view?.showListUsersSuccess(object: object)
    }
    
    func showListUsersFailed() {
        view?.showListUsersError()
    }
}
