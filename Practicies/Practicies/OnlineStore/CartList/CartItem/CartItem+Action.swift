//
//  CartItem+Action.swift
//  Practicies
//
//  Created by Lee Hojun on 2023/08/05.
//

import Foundation

extension CartItem {
  public enum Action: Equatable {
    case deleteCartItem(product: ProductModel)
  }
}
