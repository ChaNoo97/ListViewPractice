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
      NavigationView {
        
        List {
          recommendFriendSection.listSectionSeparator(.hidden)
          myFriendSection
        }
        .listStyle(.plain)
//        List(viewModel.users) { user in
//          FriendRow(user: user)
//            .wrapToButton {
//              print("wrapToButton")
//            }
//            .listRowSeparator(.hidden)
//        }
//        .listStyle(.plain)
        
      }
    }
  
}

extension FriendView {
  var recommendFriendSection: some View {
    Section("추천친구") {
      Text("ddd")
    }
  }
  
  var myFriendSection: some View {
    Section("내친구") {
      Text("dddd")
    }
  }
}

private struct ButtonWrapper: ViewModifier {
  let action: () -> Void
  
  init(action: @escaping () -> Void) {
    self.action = action
  }
  
  func body(content: Content) -> some View {
    Button(
      action: action,
      label: { content }
    )
  }
}

extension View {
  public func wrapToButton(
    action: @escaping () -> Void
  ) -> some View {
    modifier(ButtonWrapper(action: action))
  }
}
