//
//  ExtButton.swift
//  AratechUsers
//
//  Created by Esther Huecas on 06/01/2021.
//

import Foundation
import UIKit

extension UIButton {
    func floatingButton() {
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.shadowOpacity = 0.1
        self.layer.shadowOffset = CGSize(width: 0, height: 10)
    }
}
