//
//  CartItemModel.swift
//  Practicies
//
//  Created by Lee Hojun on 2023/08/05.
//

import Foundation

struct CartItemModel: Equatable {
  let product: ProductModel
  let quantity: Int
}

extension CartItemModel {
  static var sample: [CartItemModel] {
    [
      .init(
        product: ProductModel.sample[0],
        quantity: 3
      ),
      .init(
        product: ProductModel.sample[1],
        quantity: 1
      ),
      .init(
        product: ProductModel.sample[2],
        quantity: 1
      ),
    ]
  }
}
