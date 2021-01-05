//
//  ViewController.swift
//  AratechUsers
//
//  Created by Esther Huecas on 05/01/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        let loginVC = HomeRouter.createModule()
        self.present(loginVC, animated: true, completion: nil)
    }

}

