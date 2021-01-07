//
//  DetailUserViewController.swift
//  AratechUsers
//
//  Created by Esther Huecas on 06/01/2021.
//

import UIKit
import SPAlert
import RSLoadingView

class DetailUserViewController: UIViewController {
    
    //VIPER
    var presenter: ViewToPresenterDetailUserProtocol?
    //LoadingView
    var loadingView: RSLoadingView = RSLoadingView()
    //Var
    var idPressed: String!
    var dataUser: User!
    var isPressedEditBtn: Bool = false
    var count = 0
    let ui_birthday_datepicker = UIDatePicker()
    let format_datepicker_birthday = "dd/MM/yyyy"

    //MARK: - IBOutlets
    @IBOutlet weak var ui_title_label: UILabel!
    @IBOutlet weak var ui_name_label: UILabel!
    @IBOutlet weak var ui_name_textfield: UITextField!
    @IBOutlet weak var ui_birthdate_label: UILabel!
    @IBOutlet weak var ui_birthdate_textfield: UITextField!
    @IBOutlet weak var ui_edit_btn: UIButton!
    @IBOutlet weak var ui_cancel_btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //call to func config
        self.funcionalityBoolEditBtn()
        
        //Localizable.string
        self.localizabled()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //Show data in screen
        self.showData()
    }
    
    //MARK: -IBActions
    //Dismiss this screen
    @IBAction func actionDismissScreen(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //Edit button: change design
    @IBAction func actionEdit(_ sender: Any) {
        self.isPressedEditBtn = true
        self.funcionalityBoolEditBtn()
        if self.count == 2 {
            count = 0
            self.presenter?.putDetailUser(id: idPressed, object: User(id: "", name: self.ui_name_textfield.text!, birthdate: self.ui_birthdate_textfield.text!))
            self.loadingView.show(on: view)
            self.isPressedEditBtn = false
            self.funcionalityBoolEditBtn()
        }
    }
    
    //Cancel button: show alert
    @IBAction func actionCancel(_ sender: Any) {
        self.count += 1
        let refreshAlert = UIAlertController(title: NSLocalizedString("Cancel_alert_title", comment: ""), message: NSLocalizedString("Cancel_alert_body", comment: ""), preferredStyle: UIAlertController.Style.alert)

        refreshAlert.addAction(UIAlertAction(title: NSLocalizedString("Cancel_alert_yes", comment: ""), style: .default, handler: { (action: UIAlertAction!) in
            if self.count == 3 {
                self.count = 0
                self.isPressedEditBtn = false
                self.funcionalityBoolEditBtn()
            }
        }))

        refreshAlert.addAction(UIAlertAction(title: NSLocalizedString("Cancel_alert_no", comment: ""), style: .cancel, handler: { (action: UIAlertAction!) in
        }))
        present(refreshAlert, animated: true, completion: nil)
    }
    
    
    //MARK: get data from previously pressed screen
    func prepareData(id: String) {
        presenter?.getDetailUser(id: id)
        idPressed = id
    }
    
    func localizabled() {
        self.ui_name_label.text = NSLocalizedString("User_name_title", comment: "")
        self.ui_birthdate_label.text = NSLocalizedString("User_birthdate_title", comment: "")
        self.ui_edit_btn.setTitle(NSLocalizedString("Edit_title_btn", comment: ""), for: .normal)
        self.ui_cancel_btn.setTitle(NSLocalizedString("Cancel_title_btn", comment: ""), for: .normal)
    }
    
    func showData() {
        //paint data
        if dataUser.name != "" {
            self.ui_title_label.text = NSLocalizedString("Show_user_title", comment: "") + dataUser.name
        }else {
            self.ui_title_label.text = ""
        }
        self.ui_name_textfield.text = dataUser.name
        self.ui_birthdate_textfield.text = dataUser.birthdate
    }
    
    
    func funcionalityBoolEditBtn() {
        if self.isPressedEditBtn == true {
            self.editButtonIsPressed()
        }else{
            self.notPressedEditBtn()
        }
    }
    
    func notPressedEditBtn() {
        //textfield background
        self.ui_name_textfield.backgroundColor = .clear
        self.ui_birthdate_textfield.backgroundColor = .clear
        //isenabled // isHidden
        self.ui_name_textfield.isEnabled = false
        self.ui_birthdate_textfield.isEnabled = false
        self.ui_cancel_btn.isHidden = true
        //change title btn
        self.ui_title_label.text = NSLocalizedString("Show_user_title", comment: "")
        self.ui_edit_btn.setTitle(NSLocalizedString("Edit_title_btn", comment: ""), for: .normal)
    }
    
    func editButtonIsPressed() {
        //isEnabled // isHidden
        self.ui_name_textfield.isEnabled = true
        self.ui_birthdate_textfield.isEnabled = true
        self.ui_cancel_btn.isHidden = false
        //color
        self.ui_name_textfield.backgroundColor = .systemGray5
        self.ui_birthdate_textfield.backgroundColor = .systemGray5
        //change title and btn
        self.ui_title_label.text = NSLocalizedString("Edit_user_title", comment: "") + dataUser.name
        self.ui_edit_btn.setTitle(NSLocalizedString("Save_title_btn", comment: ""), for: .normal)
        //create datepicker
        self.createDatePickerBirthday()
        
        count += 1
    }
    
    //MARK: - DatePicker Birthday
    func createDatePickerBirthday(){
        FunctionConstants.shared.logMessage(message: "DetailUserViewController - createDatePickerBirthdate")
        self.setDatePicker()
    }
    
    func setDatePicker() {
        if #available(iOS 14, *) {
            self.ui_birthday_datepicker.preferredDatePickerStyle = .wheels
            self.ui_birthday_datepicker.sizeToFit()
        }
        self.ui_birthday_datepicker.datePickerMode = .date
        let toolbar = self.createToolbarPicker()
        //date max: yesterday
        let maxDate = Calendar.current.date(byAdding: .day, value: -1, to: Date())
        self.ui_birthday_datepicker.maximumDate = maxDate
        //date min: year 1920
        let minYear = Calendar.current.date(byAdding: .year, value: -100, to: Date())
        self.ui_birthday_datepicker.minimumDate = minYear
        self.ui_birthdate_textfield.inputAccessoryView = toolbar
        self.ui_birthdate_textfield.inputView = self.ui_birthday_datepicker
        self.ui_birthday_datepicker.addTarget(self, action: #selector(datePickerChanged(picker:)), for: .valueChanged)
    }
    
    func createToolbarPicker()->UIToolbar{
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Hecho", style: .plain, target: self, action: #selector(doneDatePickerBirthday))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(cancelDatePickerBirthday))
        toolbar.setItems([cancelButton,spaceButton,doneButton], animated: false)
        
        return toolbar
    }
    
    @objc func datePickerChanged(picker: UIDatePicker) {
        let date = Date()
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = df.string(from: date)
        self.ui_birthdate_textfield.text = dateString
    }

    @objc func doneDatePickerBirthday(){
        let formatter = DateFormatter()
        formatter.dateFormat = self.format_datepicker_birthday
        self.view.endEditing(true)
    }

    @objc func cancelDatePickerBirthday(){
        self.view.endEditing(true)
    }

}

//MARK: -Extension VIPER
extension DetailUserViewController : PresenterToViewDetailUserProtocol {
    //MARK: Get details
    func getDetailUserSuccess(data: User) {
        FunctionConstants.shared.logMessage(message: "DetailUserViewController - getDetailUserSuccess")
        dataUser = data
    }
    
    func getDetailUserError() {
        FunctionConstants.shared.logMessage(message: "DetailUserViewController - getDetailUserError")
    }
    
    //MARK: Put detail to user
    func putDetailUserSuccess(putData: User) {
        FunctionConstants.shared.logMessage(message: "DetailUserViewController - putDetailUserSuccess")
        self.loadingView.hide()
        SPAlert.present(message: NSLocalizedString("Alert_body_save", comment: ""), haptic: .success)
    }
    
    func putDetailUserError() {
        FunctionConstants.shared.logMessage(message: "DetailUserViewController - putDetailUserError")
    }
}
