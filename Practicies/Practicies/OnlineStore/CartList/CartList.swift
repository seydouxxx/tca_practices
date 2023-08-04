//
//  CartList.swift
//  Practicies
//
//  Created by Lee Hojun on 2023/08/05.
//

import Foundation
import ComposableArchitecture

public struct CartList {
  
}

extension CartList: Reducer {
  
  public var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .didPressCloseButton:
        return .none
      case .cartItem:
        return .none
      }
    }
  }
}
