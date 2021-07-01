//
//  UsersView.swift
//  TechOClock
//
//  Created by ThiagoGarcia on 28/06/2021.
//

import UIKit

class UsersView: UIView {
    
    @IBOutlet weak var usersContainer: UIView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
       
       
       func prepareView(){
           self.tableView.tableFooterView = UIView()
           self.tableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
       }
       
       func stopLoading(){
           self.loading.stopAnimating()
       }
       func startLoading(){
           self.loading.startAnimating()
       }
       func prepareTableView() {
           self.tableView.reloadData()
       }
    
        func setContainerHidden(isHidden  :Bool)  {
            self.usersContainer.isHidden = isHidden
        }
    
    
}
