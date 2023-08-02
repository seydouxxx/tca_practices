//
//  ContentView.swift
//  Practicies
//
//  Created by Lee Hojun on 2023/07/30.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
  var body: some View {
    //      ProductCellView(
    //        store: StoreOf<Product>(
    //          initialState: Product.State(id: UUID(), product: ProductModel.sample[0])) {
    //          Product()
    //        }
    //      )
    ProductsListView(
      store: StoreOf<ProductsList>(
        initialState: ProductsList.State(),
        reducer: {
          ProductsList(fecthProducts: { ProductModel.sample })._printChanges()
        }
      )
    )
  }
}

