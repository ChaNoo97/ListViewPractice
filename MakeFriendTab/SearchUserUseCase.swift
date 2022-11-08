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

struct User: Codable, Identifiable {
  // id 쓰면 serialization Failed 오류.. 해결 방법 고민중
  // codingKey 쓰면 해결 된다고?
  var id = UUID()
  var isFriend = Bool.random()
  var name: Name
  var picture: Picture
  
  private enum CodingKeys: String, CodingKey {
    case name
    case picture
  }
}

struct Name: Codable, CustomStringConvertible {
  var first: String
  var last: String
  
  var description: String {
    return first + last
  }
}

struct Picture: Codable {
  var large: String
  var medium: String
  var thumbnail: String
}
