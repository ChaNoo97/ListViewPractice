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
    EdgeInsets(top: 0, leading: size, bottom: 0, trailing: size)
  }
  
  class func makeEasyPadding(top: CGFloat? = nil, leading: CGFloat? = nil, bottom: CGFloat? = nil, traling: CGFloat? = nil) -> EdgeInsets {
    EdgeInsets(top: top ?? 0, leading: leading ?? 0, bottom: bottom ?? 0, trailing: traling ?? 0)
  }
  
  class func makeSymmetryPaddint(horizental: CGFloat, vertical: CGFloat) -> EdgeInsets {
    EdgeInsets(top: vertical, leading: horizental, bottom: vertical, trailing: horizental)
  }
}
