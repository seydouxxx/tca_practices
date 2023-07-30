//
//  Product+State.swift
//  Practicies
//
//  Created by Lee Hojun on 2023/07/30.
//

import Foundation

public extension Product {
  struct State: Equatable {
    
    var addToCartState = AddToCart.State()
    
    let product: ProductModel
  }
}
