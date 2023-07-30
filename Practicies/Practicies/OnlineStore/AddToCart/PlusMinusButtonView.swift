//
//  PlusMinusButtonView.swift
//  Practicies
//
//  Created by Lee Hojun on 2023/07/30.
//

import SwiftUI
import ComposableArchitecture

public struct PlusMinusButtonView {
  
  let store: StoreOf<AddToCart>
  
  init(store: StoreOf<AddToCart>) {
    self.store = store
  }
}

extension PlusMinusButtonView: View {
  public var body: some View {
    WithViewStore(store, observe: { $0 }) { viewStore in
      HStack(spacing: 5) {
        Button {
          viewStore.send(.didTapMinusButton)
        } label: {
          Text("-")
            .padding(10)
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .buttonStyle(.plain)
        
        Text("\(viewStore.count)")

        Button {
          viewStore.send(.didTapPlusButton)
        } label: {
          Text("+")
            .padding(10)
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .buttonStyle(.plain)

      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
