//
//  ContentViewModel.swift
//  MakeFriendTab
//
//  Created by HOO on 2022/11/04.
//

import Combine
import Foundation

class ContentViewModel: ObservableObject {
  
  // combine 으로 수정해보기
  public var textFieldString: String = "" {
    didSet {
      if Int(textFieldString) == nil {
        isCanGoNext = true
      } else {
        isCanGoNext = false
      }
    }
  }
  
  @Published var isCanGoNext: Bool = true
  
  public var cancellabel = Set<AnyCancellable>()
  
//  func searchUser(peopleCount: String) {
//    
//    guard let peopleCount = Int(peopleCount) else {
//      print("people Count is not INT")
//      return
//    }
//    
//    SearchUserUseCase.searchUsers(peopleCount: peopleCount)
//      .sink(receiveCompletion: { completion in
//        switch completion {
//        case .failure(let error):
//          print("ERROR: - \(error)")
//        case .finished:
//          print("finish?")
//          return
//        }
//      }, receiveValue: { users in
//        print("receive? \(users)")
//        self.users = users.results
//      }).store(in: &cancellabel)
//  }
}

extension ContentViewModel {
  func getNumber() -> Int {
    Int(self.textFieldString) ?? 0
  }
}
