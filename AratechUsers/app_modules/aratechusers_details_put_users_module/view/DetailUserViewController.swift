//
//  DetailUserViewController.swift
//  AratechUsers
//
//  Created by Esther Huecas on 06/01/2021.
//

import UIKit

class DetailUserViewController: UIViewController {
    
    //VIPER
    var presenter: ViewToPresenterDetailUserProtocol?
    
    var idPressed: String!
    var dataUser: User!

    //MARK: - IBOutlets
    @IBOutlet weak var ui_title_label: UILabel!
    @IBOutlet weak var ui_name_label: UILabel!
    @IBOutlet weak var ui_name_textfield: UITextField!
    @IBOutlet weak var ui_birthdate_label: UILabel!
    @IBOutlet weak var ui_birthdate_textfield: UITextField!
    @IBOutlet weak var ui_edit_btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.showData()
    }
    
    //MARK: get data from previously pressed screen
    func prepareData(id: String) {
        presenter?.getDetailUser(id: id)
        print("tengo id \(id)")
    }
    
    func showData() {
        self.ui_title_label.text = "USUARIO: \(dataUser.name)"
        self.ui_name_textfield.text = dataUser.name
        self.ui_birthdate_textfield.text = dataUser.birthdate
    }

}

//MARK: Extension VIPER
extension DetailUserViewController : PresenterToViewDetailUserProtocol {
    func getDetailUserSuccess(data: User) {
        FunctionConstants.shared.logMessage(message: "DetailUserViewController - getDetailUserSuccess")
        dataUser = data
    }
    
    func getDetailUserError() {
        FunctionConstants.shared.logMessage(message: "DetailUserViewController - getDetailUserError")
    }
}
