//
//  DetailUserInteractor.swift
//  AratechUsers
//
//  Created by Esther Huecas on 06/01/2021.
//

import Foundation
import Alamofire

class DetailUserInteractor: PresenterToInteractorDetailUserProtocol {
    
    var presenter: InteractorToPresenterDetailUserProtocol?
    
    //MARK: - get detail user with id
    func fetchDetailUser(id: String) {
        FunctionConstants.shared.logMessage(message: "DetailUserInteractor - fetchDetailUser")
        
        let url : String = ServicesConstants.shared.url_base + "/" + id
        var request: URLRequest = URLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        AF.request(request).responseJSON{ (response) in switch response.result {
        case.success(let JSON):
            FunctionConstants.shared.logMessage(message: "AF.request: \(JSON)")
            let responseObj = FunctionConstants.shared.decode(data: response.data, modelType: User.self)
            self.presenter?.getDetailUserFetched(data: responseObj)
            break
        
        case .failure(let error):
            FunctionConstants.shared.logMessage(message: "ERROR ALAMOFIRE \(error)")
            self.presenter?.getDetailUserFailed()
        }}
    }
}
