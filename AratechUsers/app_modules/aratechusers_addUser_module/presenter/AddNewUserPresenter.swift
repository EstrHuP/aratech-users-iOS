//
//  AddNewUserPresenter.swift
//  AratechUsers
//
//  Created by Esther Huecas on 06/01/2021.
//

import Foundation
import UIKit

class AddNewUserPresenter: ViewToPresenterAddUserProtocol {
    
    var view: PresenterToViewAddUserProtocol?
    var interactor: PresenterToInteractorAddUserProtocol?
    var router: PresenterToRouterAddUserProtocol?
    
    func postAddNewUser(sendUser: User) {
        interactor?.fetchAddNewUser(sendUser: sendUser)
    }
}

extension AddNewUserPresenter: InteractorToPresenterAddUserProtocol {
    func addUserFetched() {
        view?.addUserSuccess()
    }
    
    func addUserFailed() {
        view?.addUserError()
    }
}

