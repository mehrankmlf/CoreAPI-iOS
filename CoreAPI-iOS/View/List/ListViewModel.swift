//
//  ListViewModel.swift
//  CoreAPI-iOS
//
//  Created by Mehran on 2/23/1401 AP.
//

import Foundation
import Combine

class ListViewModel : ObservableObject {
    
    @Published var data : UsersListResponse?
    
    var getUserList: UsersListProtocol
    var subscriber = Set<AnyCancellable>()
    
    init(getUserList : UsersListProtocol = UserListRequest()) {
        self.getUserList = getUserList
    }
}

extension ListViewModel {
    func callUserListServie() {
        self.getUserList.getUserData()
            .receive(on: DispatchQueue.main)
            .sink { data in
                print(data)
            } receiveValue: { [weak self] data in
                guard let data = data else {return}
                self?.data = data
            }
            .store(in: &subscriber)
    }
}
