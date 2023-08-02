//
//  Product.swift
//  Practicies
//
//  Created by Lee Hojun on 2023/07/30.
//

import ComposableArchitecture

public struct Product {
  
  
}

extension Product: Reducer {
  public var body: some ReducerOf<Self> {
    CombineReducers {
      Scope(state: \.addToCartState, action: /Action.addToCart) {
        AddToCart()
      }
      Reduce { state, action in
        switch action {
        case .addToCart:
          return .none
        }
      }
    }
  }
}
