//
//  CartList.swift
//  Practicies
//
//  Created by Lee Hojun on 2023/08/05.
//

import Foundation
import ComposableArchitecture

public struct CartList {
  var sendOrder: ([CartItemModel]) async throws -> String
}

extension CartList: Reducer {
  
  public var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .didPressCloseButton:
        return .none
      case .cartItem(let id, let action):
        switch action {
        case .deleteCartItem:
          state.cartItem.remove(id: id)
        }
        return .none
        
      case .didPressPayButton:
        state.confirmationAlert = .init(wrappedValue: AlertState(
          title: TextState("Confirm your purchase"),
          message: TextState("Do you want to proceed with your purchase of $\(state.priceAmountString)?"),
          buttons: [
            .init(role: .none, action: .send(.confirm), label: {
              TextState("Pay $\(state.priceAmountString)")
            }),
            .init(role: .cancel, action: .send(.dismissAlert), label: {
              TextState("Cancel")
            })
          ]
        ))
        return .none
      case .didReceivePurchaseResponse(.success(_)):
        state.successAlert = .init(wrappedValue: AlertState(
          title: TextState("Thank you!"),
          message: TextState("Your order is in process."),
          buttons: [
            .default(
              TextState("Done"),
              action: .send(.alert(.dismiss))
            ),
          ]
        ))
        return .none
      case .didReceivePurchaseResponse(.failure(_)):
        state.errorAlert = .init(wrappedValue: AlertState(
          title: TextState("Oops!"),
          message: TextState("Unable to send order, try again later."),
          buttons: [
            .default(
              TextState("Done"),
              action: .send(.dismissErrorAlert(.dismiss))
            ),
          ]
        ))
        return .none
      case .didConfirmPurchase:
        let items = state.cartItem.map { $0.cartItem }
        return .run { send in
          await send(.didReceivePurchaseResponse(
            TaskResult {
              try await sendOrder(items)
            }
          ))
        }
      case .didCancelConfirmation:
        state.confirmationAlert = .init(wrappedValue: nil)
        return .none
      case .dismissErrorAlert:
        state.errorAlert = .init(wrappedValue: nil)
        return .none
      case .dismissSuccessAlert:
        state.successAlert = .init(wrappedValue: nil)
        return .none
      case .alert(let alertAction):
        switch alertAction {
        case .presented(let action):
          switch action {
          case .confirm:
            state.confirmationAlert = .init(wrappedValue: nil)
            return .send(.didConfirmPurchase)
            
          case .dismissAlert:
            ()
          }
        case .dismiss:
          ()
        }
        return .none
      }
    }
  }
}
