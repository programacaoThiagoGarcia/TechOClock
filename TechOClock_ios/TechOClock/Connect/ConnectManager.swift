//
//  ConnectManager.swift
//  TechOClock
//
//  Created by ThiagoGarcia on 30/06/2021.
//

import Foundation

class ConnectManager {
    private static var data : Data?
    
    class func registerUser(_ data : Data, _ completion : @escaping(_ res : Data?, _ erro : String?)->()){
        ConnectManager.data = data
        completion(nil,nil)
    }
    
    class func getUsers(_ completion : @escaping(_ res : Data?, _ erro : String?)->()){
        
        if ConnectManager.data != nil {
            let json = "{\"users\":[{\"nome\":\"Thiago\",\"nif\":\"123456789\",\"email\":\"thiago@itsector.pt\"}]}".data(using: .utf8)
            completion(json,nil)
        }
        
    }
}



