//
//  AddNewUserInteractor.swift
//  AratechUsers
//
//  Created by Esther Huecas on 06/01/2021.
//

import Foundation
import Alamofire

class AddNewUserInteractor: PresenterToInteractorAddUserProtocol {
    var presenter: InteractorToPresenterAddUserProtocol?
    
    func fetchAddNewUser(sendUser: User) {
        FunctionConstants.shared.logMessage(message: "AddNewUserInteractor - fetchAddNewUser")
        
        let url : String = ServicesConstants.shared.url_base
        var request: URLRequest = URLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try! JSONEncoder().encode(sendUser)
        
        AF.request(request).responseJSON{ (response) in switch response.result {
        case.success(let JSON):
            FunctionConstants.shared.logMessage(message: "AF.request: \(JSON)")
            self.presenter?.addUserFetched()
            break
        
        case .failure(let error):
            FunctionConstants.shared.logMessage(message: "ERROR ALAMOFIRE \(error)")
            self.presenter?.addUserFailed()
        }}
    }
}
