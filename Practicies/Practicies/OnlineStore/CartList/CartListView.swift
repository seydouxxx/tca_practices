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
        .safeAreaInset(edge: .bottom) {
          Button {
            viewStore.send(.didPressPayButton)
          } label: {
            HStack(alignment: .center) {
              Spacer()
              Text("Pay $\(viewStore.priceAmountString)")
                .font(.title)
                .foregroundColor(.white)
              Spacer()
            }
          }
          .frame(maxWidth: .infinity, minHeight: 60)
          .background(viewStore.isPaybuttonDisable ? .gray : .blue)
          .cornerRadius(10)
          .padding()
          .disabled(viewStore.isPaybuttonDisable)
        }
        .alert(store: store.scope(state: \.confirmationAlert, action: { .alert($0) } ))
        .alert(store: store.scope(state: \.successAlert, action: { .dismissSuccessAlert($0) }))
        .alert(store: store.scope(state: \.errorAlert, action: { .dismissErrorAlert($0) }))
      }
    }
  }
}

