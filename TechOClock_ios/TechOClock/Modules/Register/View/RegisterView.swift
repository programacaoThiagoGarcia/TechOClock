//
//  RegisterView.swift
//  TechOClock
//
//  Created by ThiagoGarcia on 27/06/2021.
//

import UIKit

class RegisterView: UIView, UITextFieldDelegate {

    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfNIF: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    
    @IBOutlet weak var tfErrorName: UILabel!
    @IBOutlet weak var tfErrorNIF: UILabel!
    @IBOutlet weak var tfErrorEmail: UILabel!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    func viewDidLoad(){
        self.viewContainer.dropCornerShadow()
        self.tfErrorName.isHidden = true
        self.tfErrorNIF.isHidden = true
        self.tfErrorEmail.isHidden = true
        
        self.tfName.delegate = self
        self.tfEmail.delegate = self
    }
    
    
    private func setNameError(){
        self.tfErrorName.isHidden = false
    }
    private func setNIFError(){
        self.tfErrorNIF.isHidden = false
    }
    private func setEmailError(){
        self.tfErrorEmail.isHidden = false
    }
    
    func validate() -> Bool{
        var isValid = true
        if self.tfName.text == "" {
            self.setNameError()
            isValid = false
        }
        if self.tfNIF.text == "" {
            self.setNIFError()
            isValid = false
        }
        if self.tfEmail.text == "" {
            self.setEmailError()
            isValid = false
        }
        return isValid
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func tfNomeGetText() -> String {
        return "\(self.tfName.text!))"
    }
    
    func tfEmailGetText() -> String {
        return "\(self.tfEmail.text!)"
    }
    
    func tfNIFGetText() -> String {
        return "\(self.tfNIF.text!)"
    }
    
    func startLoading(){
        self.loading.isHidden = false
    }
    
    func stopLoading() {
        self.loading.isHidden = true
    }
    
}
