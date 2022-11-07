//
//  FriendView.swift
//  MakeFriendTab
//
//  Created by HOO on 2022/11/07.
//

import SwiftUI

struct FriendView: View {
  
  @ObservedObject var viewModel: FriendViewModel
  
  init(_ viewModel: FriendViewModel) {
    print("friend view init")
    self.viewModel = viewModel
  }
  
    var body: some View {
      Text("Hello")
//      List(viewModel.users) { user in
//        Text(user.name.first)
//      }
    }
  
}

extension FriendView {
  
}
