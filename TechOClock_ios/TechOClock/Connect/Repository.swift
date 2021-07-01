//
//  Repository.swift
//  TechOClock
//
//  Created by ThiagoGarcia on 27/06/2021.
//

import Foundation

/*

    Esta classe comunica com a ConnectManger ou a uma Base de dados local, não fazendo distinção pois ela centraliza todas as chamadas e devolve apenas o que as ViewModels pedem.
 
 */

class Repository {
    
    func registerUser(_ user : Data, _ completion: @escaping (_ res : Data? ,_ erro : String?) -> ())  {
        ConnectManager.registerUser(user) { data, erro in
            completion(data,erro)
        }
        
    }
    
    func getUsers(_ completion : @escaping(_ res : Data?, _ erro : String?) -> ()){
        ConnectManager.getUsers { data, erro in
            completion(data,nil)
        }
        
    }
}





