//
//  ContentViewModel.swift
//  MakeFriendTab
//
//  Created by HOO on 2022/11/04.
//

import Combine
import Foundation

class ContentViewModel: ObservableObject {
  
  let buttonSubject = PassthroughSubject<Void, Never>()
  var textFieldString: String = "" {
    didSet {
      check()
    }
  }
  var isCanGoNext = true
  @Published var goToNext = false
  
  public var cancellabel = Set<AnyCancellable>()
  
  init() {
    print("Content View Model is init")
    transform()
  }
  
  func check() {
    if let number = getNumber(textFieldString) {
      if isCanGoNext == true {
        isCanGoNext = false
        objectWillChange.send()
      }
    } else {
      if isCanGoNext == false {
        isCanGoNext = true
        objectWillChange.send()
      }
    }
  }
  
  func transform() {
    buttonSubject
      .throttle(for: 0.5, scheduler: RunLoop.main, latest: false)
      .sink(receiveValue: { [weak self] in
        guard let self = self else { return }
        self.goToNext = true
      }).store(in: &cancellabel)
  }
}

extension ContentViewModel {
  func getNumber(_ str: String) -> Int? {
    Int(str)
  }
}
