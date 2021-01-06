//
//  HomeViewController.swift
//  AratechUsers
//
//  Created by Esther Huecas on 05/01/2021.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var presenter: ViewToPresenterHomeProtocol?
    var listUsers: [User] = []
    
    //MARK: - Outlets
    @IBOutlet weak var ui_tableview: UITableView!
    @IBOutlet weak var ui_addUser_btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.listUsers = [] //empty list
        self.ui_addUser_btn.floatingButton() //design floating button
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.presenter?.getListUsers() //get list
    }
    
    //Show screen to add new user
    @IBAction func actionAddUser(_ sender: Any) {
        let addUserVC = AddNewUserRouter.createModule()
        self.present(addUserVC, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! HomeTableViewCell
        
        cell.ui_id_label.text = listUsers[indexPath.row].id
        cell.ui_name_label.text = listUsers[indexPath.row].name
        cell.ui_birthdate_label.text = listUsers[indexPath.row].birthdate
        
        return cell
    }

}

extension HomeViewController: PresenterToViewHomeProtocol {
    func showListUsersSuccess(object: [User]) {
        FunctionConstants.shared.logMessage(message: "HomeViewController - getShowListUsersSuccess")
        self.listUsers = object //add data on list
        self.ui_tableview.reloadData() //reload data for show data
    }
    
    func showListUsersError() {
        FunctionConstants.shared.logMessage(message: "HomeViewController - getListError")
    }
}
