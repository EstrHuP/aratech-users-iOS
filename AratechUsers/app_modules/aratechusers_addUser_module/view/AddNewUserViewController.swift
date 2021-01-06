//
//  AddNewUserViewController.swift
//  AratechUsers
//
//  Created by Esther Huecas on 06/01/2021.
//

import UIKit

class AddNewUserViewController: UIViewController {
    
    //VIPER
    var presenter: ViewToPresenterAddUserProtocol?

    //MARK: - IBOutlets
    @IBOutlet weak var ui_title_label: UILabel!
    @IBOutlet weak var ui_name_label: UILabel!
    @IBOutlet weak var ui_name_textfield: UITextField!
    @IBOutlet weak var ui_birthdate_label: UILabel!
    @IBOutlet weak var ui_birthdate_textfield: UITextField!
    @IBOutlet weak var ui_save_btn: UIButton!
    
    let ui_birthday_datepicker = UIDatePicker()
    let format_datepicker_birthday = "dd/MM/yyyy"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Create DatePicker Birthday
        self.createDatePickerBirthday()
    }
    
    @IBAction func actionSaveNewUser(_ sender: Any) {
        if !self.ui_name_textfield.text!.isEmpty && !self.ui_birthdate_textfield.text!.isEmpty {
            /// TODO ¿FIX? - al hacer la llamada al endpoint, name me lo guarda como "name \(id)" cuando realmente le estoy pasando el textfield completo y al hacer un po ui_name_textfield en la consola, si que me responde bien el valor introducido.
            /// Pasa lo mismo con la fecha... No me da valor correcto a la hora de enviarlo a la api
            self.presenter?.postAddNewUser(sendUser: User.init(id: "", name: self.ui_name_textfield.text!, birthdate: self.ui_birthdate_textfield.text!))
            self.dismiss(animated: true, completion: nil)
        }else{
//            SPAlert.present(message: NSLocalizedString("Contact_empty_fields", comment: ""))
            
        }
    }
    
    //MARK: - DatePicker Birthday
    func createDatePickerBirthday(){
        FunctionConstants.shared.logMessage(message: "OnboardingStep1ViewController - createDatePickerBirthday")
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
        
        ///TODO - Guardar los titulos en el archivo de Strings!!
      //  let doneButton = UIBarButtonItem(title: "Input_select_done".localized, style: .plain, target: self, action: #selector(doneDatePickerBirthday))
        let doneButton = UIBarButtonItem(title: "Hecho", style: .plain, target: self, action: #selector(doneDatePickerBirthday))
        
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
      //  let cancelButton = UIBarButtonItem(title: "Input_select_cancel".localized, style: .plain, target: self, action: #selector(cancelDatePickerBirthday))
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
        self.ui_birthdate_textfield.text = ""
        self.view.endEditing(true)
    }

}

//MARK: Extension VIPER
extension AddNewUserViewController : PresenterToViewAddUserProtocol {
    func addUserSuccess() {
        FunctionConstants.shared.logMessage(message: "AddNewUserViewController - postAddUserSuccess")
    }
    
    func addUserError() {
        FunctionConstants.shared.logMessage(message: "AddNewUserViewController - postAddUserError")
        
    }
}
