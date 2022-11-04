//
//  SearchUserRouter.swift
//  MakeFriendTab
//
//  Created by HOO on 2022/11/03.
//

import Foundation
import Combine

import Alamofire

struct ApiUrl {
  static let baseURL = "https://randomuser.me/"
}

enum SearchUserRouter: URLRequestConvertible {
  case randomPeopleList(peopleCount: Int)
  
  var baseURL: URL {
    URL(string: ApiUrl.baseURL)!
  }
  
  var endPoint: String {
    switch self {
    case .randomPeopleList:
      return "api/"
    }
  }
  
  var method: HTTPMethod {
    switch self {
    case .randomPeopleList:
      return .get
    }
  }
  
  var qurey: [URLQueryItem] {
    switch self {
    case .randomPeopleList(let peopleCount):
      return [URLQueryItem(name: "results", value: "\(peopleCount)")]
    }
  }
  
  
  func asURLRequest() throws -> URLRequest {
    let urlString = baseURL.appendingPathComponent(endPoint).absoluteString
    var urlComponets = URLComponents(string: urlString)
    urlComponets?.queryItems = qurey
    
    if let url = urlComponets?.url {
      var request = URLRequest(url: url)
      request.method = method
      print("URL: \(request.url!)")
      return request
    } else {
      print("query 추가 실패")
      throw AFError.invalidURL(url: baseURL.appendingPathComponent(endPoint))
    }
  }
}

//enum API {
//  case randomPeopleList
//
//  var url: URL {
//    switch self {
//    case .randomPeopleList:
//      return URL(string: "https://randomuser.me/api/")!
//    }
//  }
//
//  var query: URLQueryItem {
//    switch self {
//    case .randomPeopleList:
//      return URLQueryItem(name: "results", value: "100")
//    }
//  }
//}
//
//enum UserApi {
//  static func findUsers() -> AnyPublisher<testModel, Error> {
//    return URLSession.shared
//      .dataTaskPublisher(for: API.randomPeopleList.url)
//      .map { $0.data }
//      .decode(type: testModel.self, decoder: JSONDecoder())
//      .eraseToAnyPublisher()
//  }
//}
//




