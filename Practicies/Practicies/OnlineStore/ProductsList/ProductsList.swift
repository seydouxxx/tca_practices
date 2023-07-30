//
//  ProductsList.swift
//  Practicies
//
//  Created by Lee Hojun on 2023/07/31.
//

import ComposableArchitecture

public struct ProductsList {
  
}

extension ProductsList: ReducerProtocol {
  public var body: some ReducerProtocolOf<Self> {
    Reduce { state, action in
      switch action {
      case .fetchProducts:
        return .none
      case .responseProducts(let result):
        return .none
      }
    }
  }
}
