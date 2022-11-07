//
//  GlobalFunction.swift
//  MakeFriendTab
//
//  Created by HOO on 2022/11/07.
//

import Foundation
import SwiftUI

class GlobalFunction {
  static let shared = GlobalFunction()
  
  /// Padding on Leading And Trailing  in size
  class func makeSidePadding(size: CGFloat) -> EdgeInsets {
    return EdgeInsets(top: 0, leading: size, bottom: 0, trailing: size)
  }
}
