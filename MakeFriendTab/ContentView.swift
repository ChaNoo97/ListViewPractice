//
//  ContentView.swift
//  MakeFriendTab
//
//  Created by HOO on 2022/11/03.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var viewModel = ContentViewModel()
  
  var body: some View {
    NavigationView {
      
      VStack(alignment: .center, spacing: 10) {
        TextField("how many people", text: $viewModel.textFieldString)
          .textFieldStyle(.plain)
        
        NavigationLink(
          destination: {
//            let vm = FriendViewModel(peopleCount: Int(viewModel.textFieldString) ?? 0)
            NavigationLazyView(
              FriendView(FriendViewModel(peopleCount: viewModel.getNumber()))
            )
//            FriendView(viewModel: FriendViewModel(peopleCount: Int(viewModel.textFieldString) ?? 0))
          },
          label: {
            Text("NextViwe")
              .font(.largeTitle)
              .padding()
              .background(Color.brown)
              .cornerRadius(10)
          }
        )
        .disabled(viewModel.isCanGoNext)
      }
      .padding(GlobalFunction.makeSidePadding(size: 20))
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
