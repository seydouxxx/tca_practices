//
//  Product.swift
//  Practicies
//
//  Created by Lee Hojun on 2023/07/30.
//

import ComposableArchitecture

public struct Product {
  
  
}

extension Product: ReducerProtocol {
  public var body: some ReducerProtocolOf<Self> {
    CombineReducers {
      Scope(state: \.addToCartState, action: /Action.addToCart) {
        AddToCart()
      }
    }
    Reduce { state, action in
      switch action {
      case .addToCart(.didTapPlusButton):
        return .none
      case .addToCart(.didTapMinusButton):
        return .none
      }
    }
    
  }
}
