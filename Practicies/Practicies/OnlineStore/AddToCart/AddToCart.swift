//
//  AddToCart.swift
//  Practicies
//
//  Created by Lee Hojun on 2023/07/30.
//

import ComposableArchitecture

public struct AddToCart {
  
  
}
extension AddToCart: ReducerProtocol {
  public var body: some ReducerProtocolOf<Self> {
    
    Reduce { state, action in
      switch action {
      case .didTapPlusButton:
        state.count += 1
        return .none
      case .didTapMinusButton:
        state.count -= 1
        return .none
      }
    }
  }
}
