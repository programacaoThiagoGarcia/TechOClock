//
//  UsersViewModel.swift
//  TechOClock
//
//  Created by ThiagoGarcia on 30/06/2021.
//

import Foundation

class UsersViewModel {
    
    let repository : Repository
    var users : Users = Users()
    
    var reloadTableViewClosure: (()->())?
    var updateLoadingStatus: (()->())?
    
    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus?()
        }
    }
    
    private var cellViewModels: [UserListCellViewModel] = [UserListCellViewModel]() {
        didSet {
            self.reloadTableViewClosure?()
        }
    }
    
    var numberOfCells: Int {
           return cellViewModels.count
       }
    
    
    init() {
        self.repository = Repository()
    }
    
    func getUsers(){
        self.isLoading = true
        self.repository.getUsers { data, erro in
            self.isLoading = false
            
            if erro != nil{
                return
            }
            do{
                let registers = try? JSONDecoder().decode(Registers.self, from: data!)
                if let _users = registers?.users {
                    self.processFetchedUser(users: _users)
                    
                }
            }
        }
    }
    
    private func createCellViewModel( user: User ) -> UserListCellViewModel {
        return UserListCellViewModel(lblName: user.nome, lblNif: user.nif, lblEmail: user.email)
    }
    
    private func processFetchedUser( users: Users ) {
        self.users.append(contentsOf: users)  // Cache
            var vms = [UserListCellViewModel]()
            for user in users {
                vms.append( self.createCellViewModel(user: user) )
            }
        self.cellViewModels.removeAll()
        self.cellViewModels.append(contentsOf: vms)
    }
    
    func getCellViewModel(at : IndexPath) -> UserListCellViewModel{
        return self.cellViewModels[at.row]
    }
    
}



