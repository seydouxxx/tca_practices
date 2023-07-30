//
//  ProductCellView.swift
//  Practicies
//
//  Created by Lee Hojun on 2023/07/30.
//

import SwiftUI
import ComposableArchitecture

public struct ProductCellView {
  let store: StoreOf<Product>
  
  init(store: StoreOf<Product>) {
    self.store = store
  }
}

extension ProductCellView: View {
  public var body: some View {
    WithViewStore(store, observe: { $0 }) { viewStore in
      VStack {
        Image(viewStore.product.imageStirng)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(height: 200)
        
        VStack(alignment: .leading) {
          Text(viewStore.product.title)
          HStack {
            Text("$\(viewStore.product.price.description)")
              .font(.title.bold())
            
            Spacer()
            
            AddToCartButton(
              store: store.scope(
                state: \.addToCartState,
                action: Product.Action.addToCart
              )
            )
          }
        }
        .font(.title)
      }
      .padding(20)
    }
  }
}

struct ProductCellView_Previews: PreviewProvider {
    static var previews: some View {
      ProductCellView(store: .init(initialState: .init(product: ProductModel.sample[0]), reducer: Product()))
    }
}
