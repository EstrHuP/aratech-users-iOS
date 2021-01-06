//
//  AddNewUserRouter.swift
//  AratechUsers
//
//  Created by Esther Huecas on 06/01/2021.
//

import Foundation
import UIKit

class AddNewUserRouter: PresenterToRouterAddUserProtocol {
    class func createModule() -> AddNewUserViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "newUserVC") as? AddNewUserViewController
        let presenter: ViewToPresenterAddUserProtocol & InteractorToPresenterAddUserProtocol = AddNewUserPresenter()
        let interactor: PresenterToInteractorAddUserProtocol = AddNewUserInteractor()
        let router: PresenterToRouterAddUserProtocol = AddNewUserRouter()
        
        view?.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view!
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
}
