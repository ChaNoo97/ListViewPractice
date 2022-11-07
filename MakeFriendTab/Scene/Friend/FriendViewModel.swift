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
  
  let initSubject = PassthroughSubject<Void, Never>()
  
  private var cancellabel = Set<AnyCancellable>()
  
  init(peopleCount: Int) {
    self.peopleCount = peopleCount
    transform()
    initSubject.send()
  }
  
  func transform() {
    initSubject
      .throttle(for: 0.5, scheduler: RunLoop.main, latest: false)
      .sink(receiveValue: { [weak self] in
        guard let self = self else { return }
        self.searchUser(peopleCount: self.peopleCount)
        }).store(in: &cancellabel)
  }
  
  func searchUser(peopleCount: Int) {
    print("start search! and peopleCount \(peopleCount)")
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
