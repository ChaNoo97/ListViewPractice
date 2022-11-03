//
//  NetworkWorker.swift
//  MakeFriendTab
//
//  Created by HOO on 2022/11/03.
//

import Foundation
import Combine

enum API {
  case randomPeopleList
  
  var url: URL {
    switch self {
    case .randomPeopleList:
      return URL(string: "https://randomuser.me/api/")!
    }
  }
  
  var query: URLQueryItem {
    switch self {
    case .randomPeopleList:
      return URLQueryItem(name: "results", value: "100")
    }
  }
}

enum UserApi {
  static func findUsers() -> AnyPublisher<testModel, Error> {
    return URLSession.shared
      .dataTaskPublisher(for: API.randomPeopleList.url)
      .map { $0.data }
      .decode(type: testModel.self, decoder: JSONDecoder())
      .eraseToAnyPublisher()
  }
}

struct testModel: Codable {
  var id: String
}
