//
//  ListViewController.swift
//  CoreAPI-iOS
//
//  Created by Mehran on 2/23/1401 AP.
//

import UIKit
import Combine

class ListViewController: BaseViewController {
    
    let cellId = "cellId"
    
    private var viewModel : ListViewModel
    private(set) var data : [UsersListResponse]? {
        didSet {
            self.tableMain.reloadData()
        }
    }
    var subscriber = Set<AnyCancellable>()
    
    @IBOutlet weak var tableMain: UITableView!
    
    init(viewModel : ListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.viewModel = ListViewModel()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.viewModel.callUserListServie()
        self.bindViewModel()
    }
    
    private func bindViewModel() {
        
        self.viewModel.$data
            .compactMap({ $0 })
            .sink { [weak self] data in
                self?.data = data
            }.store(in: &subscriber)
        
        self.viewModel.loadinState
            .sink { [weak self] state in
                self?.handleActivityIndicator(state: state)
            }
            .store(in: &subscriber)
    }
    
    private func setupUI() {
        let nibCell = UINib(nibName: "UsersTableViewCell", bundle: nil)
        tableMain.register(nibCell, forCellReuseIdentifier: cellId)
        self.renterTableView()
        self.setupNavigationBar()
    }
    
    private func renterTableView() {
        self.tableMain.delegate = self
        self.tableMain.dataSource = self
    }
    
    private func setupNavigationBar() {
        self.navigationItem.title = "UsersList"
        
    }
}

extension ListViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! UsersTableViewCell
        
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
