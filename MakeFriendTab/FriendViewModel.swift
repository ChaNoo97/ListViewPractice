//
//  FriendViewModel.swift
//  MakeFriendTab
//
//  Created by HOO on 2022/11/07.
//

import Combine
import Foundation

class FriendViewModel: ObservableObject {
  
  @Published var users = [User]()
  
  var peopleCount: Int
  
  private var cancellabel = Set<AnyCancellable>()
  
  init(peopleCount: Int) {
    self.peopleCount = peopleCount
    print("df")
    print("people count \(peopleCount)")
//    searchUser(peopleCount: peopleCount)
  }
  
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
      }).store(in: &cancellabel)
  }
}
