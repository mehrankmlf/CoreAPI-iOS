//
//  ListViewController.swift
//  CoreAPI-iOS
//
//  Created by Mehran on 2/23/1401 AP.
//

import UIKit
import Combine

class ListViewController: UIViewController {
    
    let cellId = "cellId"
    
    private(set) var data : UsersListResponse? {
        didSet {
            self.tableMain.reloadData()
        }
    }
    private var viewModel : ListViewModel
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
    }
    
    private func bindViewModel() {
        self.viewModel.$data
            .compactMap({ $0 })
            .sink { [weak self] data in
                self?.data = data
            }.store(in: &subscriber)
    }
    
    private func setupUI() {
        tableMain.register(UsersTableViewCell.self, forCellReuseIdentifier: cellId)
        self.renterTableView()
    }
    
    private func renterTableView() {
        self.tableMain.delegate = self
        self.tableMain.dataSource = self
    }
}

extension ListViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! UsersTableViewCell
        
        // set the text from the data model
        
        
        return cell
    }
}
