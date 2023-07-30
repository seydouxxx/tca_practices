//
//  ContentView.swift
//  Practicies
//
//  Created by Lee Hojun on 2023/07/30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//      AddToCartButton(store: .init(initialState: .init(), reducer: AddToCart()))
      ProductCellView(store: .init(initialState: .init(product: ProductModel.sample[0]), reducer: Product()._printChanges()))
    }
}

