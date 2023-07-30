//
//  ProductsList+Action.swift
//  Practicies
//
//  Created by Lee Hojun on 2023/07/31.
//

import ComposableArchitecture

public extension ProductsList {
  enum Action: Equatable {
    case fetchProducts
    case responseProducts(TaskResult<[ProductModel]>)
  }
}
