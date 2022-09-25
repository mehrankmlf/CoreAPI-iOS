//
//  ListViewModel.swift
//  CoreAPI-iOS
//
//  Created by Mehran on 2/23/1401 AP.
//

import Foundation
import Combine

final class ListViewModel : ObservableObject, listViewModel {
    
    let cellId = "cellId"
    let title = "UsersList"
    
    private var getUserList: UsersListProtocol
    var loadinState = CurrentValueSubject<ViewModelStatus, Never>(.dismissAlert)
    var subscriber = Set<AnyCancellable>()
    @Published var data : [UsersListResponse]?
    
    init(getUserList : UsersListProtocol = UserListRequest()) {
        self.getUserList = getUserList
    }
}

extension ListViewModel {
    func callUserListServie() {
        self.loadinState.send(.loadStart)
        self.getUserList.getUserData()
            .receive(on: DispatchQueue.main)
            .sink { data in
                self.loadinState.send(.dismissAlert)
            } receiveValue: { [weak self] data in
                guard let data = data else {return}
                self?.data = data.data
            }
            .store(in: &subscriber)
    }
}
