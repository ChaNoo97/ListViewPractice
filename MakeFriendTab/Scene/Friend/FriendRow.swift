//
//  FriendRow.swift
//  MakeFriendTab
//
//  Created by HOO on 2022/11/08.
//

import SwiftUI

import Kingfisher

struct FriendRow: View {
  
  var user: User
  
  var body: some View {
    HStack(spacing: 8) {
      profilImageView
        .wrapToButton {
          print("profil img tap \(user.id)")
        }
      nameText
      Spacer()
      FriendRowActionButton(isFriend: user.isFriend, uuid: user.id)
    }.padding([.leading, .trailing], 20)
  }
}

extension FriendRow {
  
  var profilImageView: some View {
    KFImage(URL(string: user.picture.thumbnail)!)
      .resizable()
      .frame(width: 44, height: 44)
      .clipShape(RoundedRectangle(cornerRadius: 16))
      .overlay(
        RoundedRectangle(cornerRadius: 16).stroke(Color.purple, lineWidth: 4)
      )
  }
  
  var nameText: some View {
    Text(user.name.description)
  }
  
}

struct FriendRow_Previews: PreviewProvider {
  static var previews: some View {
    FriendRow(
      user: User(
        name: Name(first: "Hoo", last: "Kim"),
        picture: Picture(
          large: "https://randomuser.me/api/portraits/men/75.jpg",
          medium: "https://randomuser.me/api/portraits/med/men/75.jpg",
          thumbnail: "https://randomuser.me/api/portraits/thumb/men/75.jpg"
        )
      )
    )
  }
}
