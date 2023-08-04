//
//  ProductsList+State.swift
//  Practicies
//
//  Created by Lee Hojun on 2023/07/31.
//

import Foundation
import ComposableArchitecture

public extension ProductsList {
  struct State: Equatable {
    var shouldOpenCart: Bool = false
    
    var products: IdentifiedArrayOf<Product.State> = []
    var cartState: CartList.State?
  }
}
