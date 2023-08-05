//
//  CartList+Action.swift
//  Practicies
//
//  Created by Lee Hojun on 2023/08/05.
//

import ComposableArchitecture
import Foundation

extension CartList {
  public enum Action: Equatable {
    case didPressCloseButton
    case cartItem(id: CartItem.State.ID, action: CartItem.Action)
    case didPressPayButton
    case didReceivePurchaseResponse(TaskResult<String>)
    case didConfirmPurchase
    case didCancelConfirmation(PresentationAction<Action>)
    case dismissSuccessAlert(PresentationAction<Action>)
    case dismissErrorAlert(PresentationAction<Action>)
    
    case alert(PresentationAction<AlertAction>)
    
    public enum AlertAction {
      case confirm
      case dismissAlert
    }
  }
}
