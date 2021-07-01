//
//  RegisterConclusionViewController.swift
//  TechOClock
//
//  Created by ThiagoGarcia on 27/06/2021.
//

import UIKit

class RegisterConclusionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func backToRootViewController(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
