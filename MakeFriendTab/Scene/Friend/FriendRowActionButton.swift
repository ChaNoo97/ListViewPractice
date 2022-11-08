//
//  FriendRowActionButton.swift
//  MakeFriendTab
//
//  Created by HOO on 2022/11/08.
//

import SwiftUI

struct FriendRowActionButton: View {
  var isFriend: Bool
  var uuid: UUID
  
    var body: some View {
      
//      VStack {
//        friendButton
//        notFriendButton
//      }
      
      if isFriend {
        friendButton
      } else {
        notFriendButton
      }
    }
}

extension FriendRowActionButton {
  
  var friendButton: some View {
    Button(
      action: {
        print("\(uuid) 로 송금하기")
      },
      label: {
        Text("송금")
          .font(.system(size: 12))
          .foregroundColor(.white)
          .padding(
            GlobalFunction.makeSymmetryPaddint(horizental: 12, vertical: 7)
          )
          .background(Color.green)
          .clipShape(RoundedRectangle(cornerRadius: 12))
      }
    ).buttonStyle(.plain)
    // buttonStyle(.borderless or .plain) 해줘야 row tap 액션과 분리 가능
    // buttonStyle(.bordered or .borderedProminent) UI 변경
    // buttonStyle(.automatic) => X
  }
  
  var notFriendButton: some View {
    Button(
      action: {
        print("\(uuid) 를 친구추가")
      },
      label: {
        Text("친구추가")
          .font(.system(size: 12))
          .foregroundColor(.green)
          .padding(
            GlobalFunction.makeSymmetryPaddint(horizental: 12, vertical: 7)
          )
//          .clipShape(RoundedRectangle(cornerRadius: 12))
          .overlay(
            RoundedRectangle(cornerRadius: 12).stroke(Color.green, lineWidth: 2)
          )
      }
    )
  }
  
}

struct FriendRowActionButton_Previews: PreviewProvider {
    static var previews: some View {
      FriendRowActionButton(isFriend: false, uuid: UUID())
    }
}
