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
    self.viewModel = viewModel
  }
  
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
  
}
