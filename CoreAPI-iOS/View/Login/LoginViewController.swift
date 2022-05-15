//
//  LoginViewController.swift
//  CoreAPI-iOS
//
//  Created by Mehran on 2/23/1401 AP.
//

import UIKit
import Combine

class LoginViewController: BaseViewController {
    
    private var viewModel : LoginViewModel
    var subscriber = Set<AnyCancellable>()
    
    @IBOutlet weak var btnLogin: UIButton!
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.viewModel = LoginViewModel()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.bindViewModel()
    }
    
    @IBAction func btnLogin_Clicked(_ sender: Any) {
        self.viewModel.callLoginService(email: "eve.holt@reqres.in", password: "cityslicka")
    }
    
    private func bindViewModel() {
        self.viewModel.$loginData
            .compactMap({ $0 })
            .sink { [weak self] data in
                guard !String.isNilOrEmpty(string: data.token) else {return}
                self?.pushToListViewController()
            }.store(in: &subscriber)
        
        self.viewModel.loadinState
            .sink { [weak self] state in
                self?.handleActivityIndicator(state: state)
            }
            .store(in: &subscriber)
    }
    
    private func setupUI() {
        self.setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtonItem
    }
}

extension LoginViewController {
    private func pushToListViewController() {
        let vc = Storyboard.main.instantiate(ListViewController.self)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension LoginViewController {
    private func handleActivityIndicator(state : ViewModelStatus) {
        switch state {
        case .loadStart:
            self.showActivityIndicator(uiView: view)
        case .dismissAlert:
            self.hideActivityIndicator(uiView: view)
        }
    }
}
