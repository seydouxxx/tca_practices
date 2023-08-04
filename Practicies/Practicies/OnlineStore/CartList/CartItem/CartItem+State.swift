//
//  CartItem+State.swift
//  Practicies
//
//  Created by Lee Hojun on 2023/08/05.
//

import Foundation

extension CartItem {
  public struct State: Equatable, Identifiable {
    public let id: UUID
    let cartItem: CartItemModel
  }
}
