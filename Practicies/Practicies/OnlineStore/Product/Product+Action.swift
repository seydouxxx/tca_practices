//
//  Product+Action.swift
//  Practicies
//
//  Created by Lee Hojun on 2023/07/30.
//

import Foundation

public extension Product {
  enum Action: Equatable {
    case addToCart(AddToCart.Action)
  }
}
