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
    @IBOutlet var ui_tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.listUsers = [] //empty list
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.presenter?.getListUsers() //get list
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
