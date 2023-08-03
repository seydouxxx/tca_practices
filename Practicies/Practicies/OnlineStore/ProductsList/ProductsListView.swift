//
//  ProductsListView.swift
//  Practicies
//
//  Created by Lee Hojun on 2023/08/02.
//

import SwiftUI
import ComposableArchitecture

public struct ProductsListView {
  let store: StoreOf<ProductsList>
  
  init(store: StoreOf<ProductsList>) {
    self.store = store
  }
}

extension ProductsListView: View {
  public var body: some View {
    WithViewStore(store, observe: { $0 }) { viewStore in
      NavigationStack {
        List {
          ForEachStore(
            store.scope(
              state: \.products,
              action: ProductsList.Action.product(id:action:)
            )
          ) {
            ProductCellView(store: $0)
          }
        }
        .task {
          viewStore.send(.fetchProducts)
        }
        .navigationTitle("Products")
        .toolbar {
          ToolbarItem(placement: .topBarTrailing) {
            Button {
              viewStore.send(.openCart)
            } label: {
              Text("Go to Cart")
            }
          }
        }
        .sheet(
          isPresented: viewStore.binding(
            get: \.shouldOpenCart,
            send: .openCart
          )
        ) {
          CartListView()
        }
      }
    }
  }
}
