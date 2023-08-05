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
    var priceAmount: Double { cartItem.map { $0.cartItem.product.price * Double($0.cartItem.quantity) }.reduce(0, +)  }
    var priceAmountString: String { (round(priceAmount * 100) / 100).description }
    var isPaybuttonDisable: Bool { priceAmount == 0.0 }
    
    var confirmationAlert: PresentationState<AlertState<CartList.Action.AlertAction>> = .init(wrappedValue: nil)
    var errorAlert: PresentationState<AlertState<Action>> = .init(wrappedValue: nil)
    var successAlert: PresentationState<AlertState<Action>> = .init(wrappedValue: nil)
  }
}
