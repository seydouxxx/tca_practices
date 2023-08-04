//
//  CartList+State.swift
//  Practicies
//
//  Created by Lee Hojun on 2023/08/05.
//

import Foundation
import ComposableArchitecture

extension CartList {
  public struct State: Equatable {
    var cartItem: IdentifiedArrayOf<CartItem.State> = []
  }
}
