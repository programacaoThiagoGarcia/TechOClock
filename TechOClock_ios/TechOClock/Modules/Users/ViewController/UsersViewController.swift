//
//  UsersViewController.swift
//  TechOClock
//
//  Created by ThiagoGarcia on 28/06/2021.
//

import UIKit

class UsersViewController: UIViewController {
    
    var mainView : UsersView {
        get{
            return view as! UsersView
        }
    }
    
    lazy var viewModel : UsersViewModel = {
         return UsersViewModel()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainView.prepareView()
//        self.mainView.tableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.initViewModel()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewModel.getUsers()
    }
    
    private func initViewModel(){
        self.viewModel.reloadTableViewClosure = {[weak self] () in
            DispatchQueue.main.async {
                self?.mainView.setContainerHidden(isHidden: self?.viewModel.numberOfCells == 0)
                self?.mainView.prepareTableView()
            }
        }
        
        self.viewModel.updateLoadingStatus = {[weak self] () in
            DispatchQueue.main.async {
                let loading = self?.viewModel.isLoading ?? false
                if loading {
                    self?.mainView.startLoading()
                }else{
                    self?.mainView.stopLoading()
                }
            }
        }
        
    }
    
}


//-MARK: Métodos de tableView Delegate e DataSource
extension UsersViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell   = tableView.dequeueReusableCell(withIdentifier: "cell") as! UserTableViewCell
        let cellVM = viewModel.getCellViewModel(at: indexPath)
        cell.userListCellViewModel = cellVM
        return cell
    }
    
}
