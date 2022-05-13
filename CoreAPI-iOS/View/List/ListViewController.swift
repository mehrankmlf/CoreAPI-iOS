//
//  ListViewController.swift
//  CoreAPI-iOS
//
//  Created by Mehran on 2/23/1401 AP.
//

import UIKit
import Combine

class ListViewController: UIViewController {
    
    private var viewModel : ListViewModel
    var subscriber = Set<AnyCancellable>()
    
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
        self.viewModel.callUserListServie()
    }
    
    private func bindViewModel() {
        self.viewModel.$data
            .compactMap({ $0 })
            .sink { [weak self] data in
                
            }.store(in: &subscriber)
    }
}
