//
//  HomeInteractor.swift
//  AratechUsers
//
//  Created by Esther Huecas on 05/01/2021.
//

import Foundation
import Alamofire

class HomeInteractor: PresenterToInteractorHomeProtocol {
    
    var presenter: InteractorToPresenterHomeProtocol?
    
    //GET - show list of users
    func fetchListUsers() {
        FunctionConstants.shared.logMessage(message: "HomeInteractor - fetchListUsers")
        
        let url : String = ServicesConstants.shared.url_base
        var request: URLRequest = URLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        AF.request(request).responseJSON{ (response) in switch response.result {
        case.success(let JSON):
            FunctionConstants.shared.logMessage(message: "AF.request: \(JSON)")
            
            let responseObj = FunctionConstants.shared.decode(data: response.data, modelType: [User].self)
            self.presenter?.showListUsersFetched(object: responseObj)
            break
        
        case .failure(let error):
            FunctionConstants.shared.logMessage(message: "ERROR ALAMOFIRE \(error)")
            self.presenter?.showListUsersFailed()
        }}
    }
}
