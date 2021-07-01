//
//  RegisterViewController.swift
//  TechOClock
//
//  Created by ThiagoGarcia on 27/06/2021.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var mainView : RegisterView{
            get {
                return view as! RegisterView
            }
        }
    
    lazy var viewModel : RegisterViewModel = {
        return RegisterViewModel()
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainView.viewDidLoad()
        self.initViewModel()
    }
    
    private func initViewModel() {
        
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
        
        self.viewModel.progressView = {[weak self] () in
            DispatchQueue.main.async {
                let res = self?.viewModel.response.error
                if(res != nil){
                 print(res)
                }
                self?.goToConclusion()
            }
        }
        
    }
    
    private func goToConclusion(){
        let vc  = self.storyboard?.instantiateViewController(identifier: "RegisterConclusionViewController")
        if let destiny = vc {
            self.navigationController?.pushViewController(destiny, animated: true)
        }
    }
    
    
    
    @IBAction func conclusionRegister(_ sender: UIButton) {
        let result = self.mainView.validate()
        
        if result {
            self.viewModel.name  = self.mainView.tfName.text
            self.viewModel.nif   = self.mainView.tfNIF.text
            self.viewModel.email = self.mainView.tfEmail.text
            
            self.viewModel.registerUser()
        }

    }
    
    

}
