//
//  ContentViewModel.swift
//  MakeFriendTab
//
//  Created by HOO on 2022/11/04.
//

import Combine
import Foundation

class ContentViewModel: ObservableObject {
  
  @Published var users = [User]()
  
  func searchUser(peopleCount: Int) {
    SearchUserUseCase.searchUsers(peopleCount: peopleCount)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
          print("ERROR: - \(error)")
        case .finished:
          print("finish?")
          return
        }
      }, receiveValue: { users in
        print("receive? \(users)")
        self.users = users.results
      })
  }
}
