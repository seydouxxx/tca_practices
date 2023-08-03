//
//  ProductsList.swift
//  Practicies
//
//  Created by Lee Hojun on 2023/07/31.
//

import ComposableArchitecture
import Foundation

public struct ProductsList {
  
  var fecthProducts: () async throws -> [ProductModel]
  
}

extension ProductsList: Reducer {
  public var body: some Reducer<ProductsList.State, ProductsList.Action> {
    
    Reduce { state, action in
      switch action {
      case .fetchProducts:
        return .run { send in
          await send(.responseProducts(
            TaskResult {
              try await fecthProducts()
            }
          ))
        }
      case .responseProducts(.success(let products)):
        state.products = IdentifiedArray(
          uniqueElements: products
            .map {
              Product.State(id: UUID(), product: $0)
            }
        )
        return .none
      case .responseProducts(.failure(let error)):
        print(error.localizedDescription)
        print("Unable to fetch products")
        return .none
      case .openCart:
        state.shouldOpenCart = true
        return .none
      case .product:
        return .none
      }
    }
    .forEach(\.products, action: /Action.product(id:action:)) {
      Product()
    }
    
  }
}
