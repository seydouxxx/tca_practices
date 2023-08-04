//
//  CartList+Action.swift
//  Practicies
//
//  Created by Lee Hojun on 2023/08/05.
//

import Foundation

extension CartList {
  public enum Action: Equatable {
    case didPressCloseButton
    case cartItem(id: CartItem.State.ID, action: CartItem.Action)
  }
}
