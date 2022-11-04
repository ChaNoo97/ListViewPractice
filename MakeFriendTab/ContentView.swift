//
//  ContentView.swift
//  MakeFriendTab
//
//  Created by HOO on 2022/11/03.
//

import SwiftUI

struct ContentView: View {
  private var viewModel = ContentViewModel()
  
    var body: some View {
        VStack {
            Button(action: {
              viewModel.searchUser(peopleCount: 10)
            }, label: {
              Text("Test!")
                .font(.system(size: 20))
                .padding(20)
                .cornerRadius(5)
                .background(Color.cyan)
            })
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
