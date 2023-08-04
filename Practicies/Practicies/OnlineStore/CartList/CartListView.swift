//
//  CartListView.swift
//  Practicies
//
//  Created by Lee Hojun on 2023/08/03.
//

import SwiftUI
import ComposableArchitecture

public struct CartListView {
  let store: StoreOf<CartList>
  
  init(store: StoreOf<CartList>) {
    self.store = store
  }
}

extension CartListView: View {
  public var body: some View {
    WithViewStore(store, observe: { $0 }) { viewStore in
      NavigationStack {
        List {
          ForEachStore(
            store.scope(
              state: \.cartItem,
              action: CartList.Action.cartItem(id:action:)
            )
          ) { store in
            CartItemCellView(store: store)
          }
        }
        .navigationTitle("Cart")
        .toolbar {
          ToolbarItem(placement: .topBarLeading) {
            Button {
              viewStore.send(.didPressCloseButton)
            } label: {
              Text("Close")
            }
          }
        }
      }
    }
  }
}

