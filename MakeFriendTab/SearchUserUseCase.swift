//
//  SearchUserUseCase.swift
//  MakeFriendTab
//
//  Created by HOO on 2022/11/04.
//

import Combine
import Foundation

import Alamofire

enum SearchUserUseCase {
    
  static func searchUsers(peopleCount: Int) -> AnyPublisher<Result, AFError> {
    return AF.request(SearchUserRouter.randomPeopleList(peopleCount: peopleCount))
      .publishDecodable(type: Result.self, decoder: JSONDecoder())
      .value()
    
  }
}

struct Result: Codable {
  var results: [User]
}

struct User: Codable {
  var name: Name
  var picture: Picture
}

struct Name: Codable {
  var first: String
  var last: String
}

struct Picture: Codable {
  var large: String
  var medium: String
  var thumbnail: String
}
