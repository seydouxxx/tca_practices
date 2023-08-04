//
//  CartItem.swift
//  Practicies
//
//  Created by Lee Hojun on 2023/08/05.
//

import Foundation
import ComposableArchitecture

public struct CartItem {
  
}

extension CartItem: Reducer {
  public var body: some ReducerOf<Self> {
    
    Reduce { state, action in
      return .none
    }
  }
}
