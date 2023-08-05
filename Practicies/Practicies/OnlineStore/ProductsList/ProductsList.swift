//
//  ProductsList.swift
//  Practicies
//
//  Created by Lee Hojun on 2023/07/31.
//

import ComposableArchitecture
import Foundation

public struct ProductsList {
  
  var fecthProducts: () async throws -> [ProductModel]
  
}

extension ProductsList: Reducer {
  public var body: some Reducer<ProductsList.State, ProductsList.Action> {
    
    Reduce { state, action in
      switch action {
      case .fetchProducts:
        return .run { send in
          await send(.responseProducts(
            TaskResult {
              try await fecthProducts()
            }
          ))
        }
      case .responseProducts(.success(let products)):
        state.products = IdentifiedArray(
          uniqueElements: products
            .map {
              Product.State(id: UUID(), product: $0)
            }
        )
        return .none
      case .responseProducts(.failure(let error)):
        print(error.localizedDescription)
        print("Unable to fetch products")
        return .none
      case .setCart(let isPresented):
        state.shouldOpenCart = isPresented
        state.cartState = isPresented
        ? CartList.State(
          cartItem: IdentifiedArray(
            uniqueElements: state.products
              .compactMap {
                $0.addToCartState.count > 0
                ? CartItem.State(
                  id: UUID(),
                  cartItem: CartItemModel(
                    product: $0.product,
                    quantity: $0.count
                  )
                )
                : nil
              }
          )
        )
        : nil
        return .none
      case .product:
        return .none
      case .cart(let action):
        switch action {
        case .didPressCloseButton:
          print("didPressClosebutton")
          state.shouldOpenCart = false
        case .cartItem(_, let action):
          switch action {
          case .deleteCartItem(let product):
            guard let index = state.products.firstIndex(
              where: { $0.product.id == product.id })
            else { return .none }
            let productStateId = state.products[index].id
            state.products[id: productStateId]?.count = 0
          }
        }
        return .none
      }
    }
    .forEach(\.products, action: /Action.product(id:action:)) {
      Product()
    }
    .ifLet(\.cartState, action: /Action.cart) {
      CartList()
    }
  }
}
