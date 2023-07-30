//
//  AddToCartButtonView.swift
//  Practicies
//
//  Created by Lee Hojun on 2023/07/30.
//

import SwiftUI
import ComposableArchitecture

public struct AddToCartButton {
  
  let store: StoreOf<AddToCart>
  
  init(store: StoreOf<AddToCart>) {
    self.store = store
  }
}

extension AddToCartButton: View {
  public var body: some View {
    WithViewStore(store, observe: { $0 }) { viewStore in
      if viewStore.count > 0 {
        PlusMinusButtonView(store: store)
      } else {
        Button {
          viewStore.send(.didTapPlusButton)
        } label: {
          Text("Add To Cart")
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
