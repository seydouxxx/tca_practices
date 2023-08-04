//
//  Product+State.swift
//  Practicies
//
//  Created by Lee Hojun on 2023/07/30.
//

import Foundation

public extension Product {
  struct State: Equatable, Identifiable {
    public var id: UUID
    var addToCartState = AddToCart.State()
    let product: ProductModel
    
    var count: Int {
      get { addToCartState.count }
      set { addToCartState.count = newValue }
    }
  }
}
