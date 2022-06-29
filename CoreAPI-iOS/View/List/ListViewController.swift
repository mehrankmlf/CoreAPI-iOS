//
//  ListViewController.swift
//  CoreAPI-iOS
//
//  Created by Mehran on 2/23/1401 AP.
//

import UIKit
import Combine

class ListViewController: BaseViewController {

    private var viewModel : ListViewModel!
    private(set) var data : [UsersListResponse]? {
        didSet {
            self.tableView.reloadData()
        }
    }
    var subscriber = Set<AnyCancellable>()
    
    private lazy var viewContainer : UIView = {
        let viewContainer = UIView()
        viewContainer.backgroundColor = .white
        viewContainer.translatesAutoresizingMaskIntoConstraints = false
        return viewContainer
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.frame = self.view.frame
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    init(viewModel : ListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.viewModel?.callUserListServie()
        self.bindViewModel()
    }
    
    private func bindViewModel() {
        
        self.viewModel?.$data
            .compactMap({ $0 })
            .sink { [weak self] data in
                self?.data = data
            }.store(in: &subscriber)
        
        self.viewModel?.loadinState
            .sink { [weak self] state in
                self?.handleActivityIndicator(state: state)
            }
            .store(in: &subscriber)
    }
    
    private func setupUI() {
        tableView.register(UsersTableViewCell.self, forCellReuseIdentifier: viewModel.cellId)
        self.setupNavigationBar()
        let elements = [viewContainer, tableView]
        for element in elements {
            view.addSubview(element)
        }
        self.setupAutoLayout()
    }
    
    private func setupNavigationBar() {
        self.navigationItem.title = viewModel.title
    }
}

extension ListViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.cellId, for: indexPath) as! UsersTableViewCell
        guard let data = self.data else {return cell}
        cell.setupParametrs(items: data[indexPath.row])
        return cell
    }
}

extension ListViewController {
    private func handleActivityIndicator(state : ViewModelStatus) {
        switch state {
        case .loadStart:
            self.showActivityIndicator(uiView: view)
        case .dismissAlert:
            self.hideActivityIndicator(uiView: view)
        }
    }
}

extension ListViewController {
    private func setupAutoLayout() {
        viewContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        viewContainer.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        viewContainer.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        viewContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        tableView.topAnchor.constraint(equalTo: viewContainer.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: viewContainer.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: viewContainer.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor).isActive = true
    }
}
