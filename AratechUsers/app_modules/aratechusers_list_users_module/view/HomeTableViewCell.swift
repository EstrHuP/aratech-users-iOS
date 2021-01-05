//
//  HomeTableViewCell.swift
//  AratechUsers
//
//  Created by Esther Huecas on 05/01/2021.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var ui_name_label: UILabel!
    @IBOutlet weak var ui_birthdate_label: UILabel!
    @IBOutlet weak var ui_id_label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
