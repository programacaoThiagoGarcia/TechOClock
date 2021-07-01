//
//  RegisterViewModel.swift
//  TechOClock
//
//  Created by ThiagoGarcia on 27/06/2021.
//

import Foundation

class RegisterViewModel  {
    let repository          : Repository
    var progressView        : (()->())?
    var updateLoadingStatus : (()->())?
    var name, nif, email : String?
    
    var isLoading: Bool = false {
            didSet {
                self.updateLoadingStatus?()
            }
    }
    
    var response : (res: String?, error: String?) = (nil,nil) {
        didSet{
            self.progressView?()
        }
    }
    
    
    init() {
        self.repository = Repository()
    }
    
    func registerUser(){
        
        let  user = User(nome: self.name!, nif: self.nif!, email:self.email!)
        let parameters = try? JSONEncoder().encode(user)
        
        self.isLoading = true
        
        self.repository.registerUser(parameters!) { data, error in
            self.isLoading = false
            if error != nil{
                self.response = (nil,"ERROR")
            }
                self.response = ("Success",nil)
        }
    }
    
}
