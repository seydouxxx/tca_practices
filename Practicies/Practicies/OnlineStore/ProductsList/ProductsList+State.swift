//
//  ProductsList+State.swift
//  Practicies
//
//  Created by Lee Hojun on 2023/07/31.
//

import Foundation

public extension ProductsList {
  struct State: Equatable {
    var products: [Product.State] = []
  }
}
