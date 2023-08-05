//
//  CartItemCellView.swift
//  Practicies
//
//  Created by Lee Hojun on 2023/08/05.
//

import SwiftUI
import ComposableArchitecture

struct CartItemCellView {
  
  let store: StoreOf<CartItem>
  
  init(store: StoreOf<CartItem>) {
    self.store = store
  }
}

extension CartItemCellView: View {
  public var body: some View {
    WithViewStore(store, observe: { $0 }) { viewStore in
      VStack {
        HStack {
          AsyncImage(url: URL(string: viewStore.cartItem.product.imageStirng)) {
            $0
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 100, height: 100)
          } placeholder: {
            ProgressView()
              .frame(width: 100, height: 100)
          }
          
          VStack(alignment: .leading) {
            Text(viewStore.cartItem.product.title)
              .lineLimit(3)
              .minimumScaleFactor(0.5)
            HStack {
              Text("$\(viewStore.cartItem.product.price)")
                .font(.body)
                .fontWeight(.bold)
            }
          }
        }
        ZStack {
          Group {
            Text("Quantity: ")
            +
            Text("\(viewStore.cartItem.quantity)")
              .fontWeight(.bold)
          }
          .font(.body)
          
          HStack {
            Spacer()
            Button {
              viewStore.send(.deleteCartItem(
                product: viewStore.cartItem.product
              ))
            } label: {
              Image(systemName: "trash.fill")
                .foregroundColor(.red)
                .padding()
            }
          }
        }
      }
      .font(.body)
      .padding([.bottom, .top], 10)
    }
  }
}
