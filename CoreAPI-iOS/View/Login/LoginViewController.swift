//
//  LoginViewController.swift
//  CoreAPI-iOS
//
//  Created by Mehran on 2/23/1401 AP.
//

import UIKit
import Combine

class LoginViewController: BaseViewController {
    
    private var viewModel : LoginViewModel?
    var subscriber = Set<AnyCancellable>()
    
    private lazy var viewContainer : UIView = {
        let viewContainer = UIView()
        viewContainer.backgroundColor = .white
        viewContainer.translatesAutoresizingMaskIntoConstraints = false
        return viewContainer
    }()
    
    private lazy var imageAvatar : UIImageView = {
        let imageAvatar = UIImageView()
        imageAvatar.image = UIImage( named: "avatar")
        imageAvatar.contentMode = .scaleAspectFill
        imageAvatar.translatesAutoresizingMaskIntoConstraints = false
        return imageAvatar
    }()
    
    private lazy var btnLogin : UIButton = {
        let btnLogin = UIButton()
        btnLogin.setTitle("Login", for: .normal)
        btnLogin.backgroundColor = #colorLiteral(red: 0.1403488219, green: 0.1641628742, blue: 0.1974385381, alpha: 1)
        btnLogin.setTitleColor(UIColor.white, for: .normal)
        btnLogin.layer.cornerRadius = 15
        btnLogin.clipsToBounds = true
        btnLogin.translatesAutoresizingMaskIntoConstraints = false
        btnLogin.addTarget(self, action: #selector(loginButton_Clicked), for: .touchUpInside)
        return btnLogin
    }()
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.bindViewModel()
    }
    
    private func bindViewModel() {
        self.viewModel?.$loginData
            .compactMap({ $0 })
            .sink { [weak self] data in
                guard !String.isNilOrEmpty(string: data.token) else {return}
                self?.pushToListViewController()
            }.store(in: &subscriber)
        
        self.viewModel?.loadinState
            .sink { [weak self] state in
                self?.handleActivityIndicator(state: state)
            }
            .store(in: &subscriber)
    }
    
    private func setupUI() {
        let elements = [viewContainer, imageAvatar, btnLogin]
        for element in elements {
            view.addSubview(element)
        }
        self.setupNavigationBar()
        self.setupAutoLayout()
    }
    
    private func setupNavigationBar() {
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    @objc func loginButton_Clicked() {
        self.viewModel?.callLoginService(email: "eve.holt@reqres.in", password: "cityslicka")
    }
}

extension LoginViewController {
    private func pushToListViewController() {
        let vc = ListViewController(viewModel: ListViewModel())
        navigationController?.pushViewController(vc, animated: true)
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

extension LoginViewController {
    private func setupAutoLayout() {
        viewContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        viewContainer.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        viewContainer.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        viewContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        imageAvatar.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageAvatar.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageAvatar.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor).isActive = true
        imageAvatar.topAnchor.constraint(equalTo: viewContainer.topAnchor, constant: 20).isActive = true
        
        btnLogin.heightAnchor.constraint(equalToConstant: 40).isActive = true
        btnLogin.centerXAnchor.constraint(equalTo: imageAvatar.centerXAnchor).isActive = true
        btnLogin.topAnchor.constraint(equalTo: imageAvatar.bottomAnchor, constant: 40).isActive = true
        btnLogin.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 50).isActive = true
        btnLogin.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -50).isActive = true
    }
}
