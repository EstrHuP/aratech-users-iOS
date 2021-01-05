//
//  HomeRouter.swift
//  AratechUsers
//
//  Created by Esther Huecas on 05/01/2021.
//

import Foundation
import UIKit

class HomeRouter: PresenterToRouterHomeProtocol {
    
    class func createModule() -> HomeViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "HomeVC") as? HomeViewController
        let presenter: ViewToPresenterHomeProtocol & InteractorToPresenterHomeProtocol = HomePresenter()
        let interactor: PresenterToInteractorHomeProtocol = HomeInteractor()
        let router: PresenterToRouterHomeProtocol = HomeRouter()
        
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
