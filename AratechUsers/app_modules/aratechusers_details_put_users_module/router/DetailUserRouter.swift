//
//  DetailUserRouter.swift
//  AratechUsers
//
//  Created by Esther Huecas on 06/01/2021.
//

import Foundation
import UIKit

class DetailUserRouter: PresenterToRouterDetailUserProtocol {
    class func createModule() -> DetailUserViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "detailUserVC") as? DetailUserViewController
        let presenter: ViewToPresenterDetailUserProtocol & InteractorToPresenterDetailUserProtocol = DetailUserPresenter()
        let interactor: PresenterToInteractorDetailUserProtocol = DetailUserInteractor()
        let router: PresenterToRouterDetailUserProtocol = DetailUserRouter()

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
