//
//  NavigationLazyView.swift
//  MakeFriendTab
//
//  Created by HOO on 2022/11/07.
//

import Foundation
import SwiftUI

struct NavigationLazyView<Content: View>: View {
  let build: () -> Content
  init(_ build: @autoclosure @escaping () -> Content) {
    self.build = build
  }
  var body: Content {
    build()
  }
}

