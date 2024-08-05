//
//  ContentView.swift
//  OnlineShop
//
//  Created by csd_setup on 05.08.2024.
//

import SwiftUI
import FirebaseFirestore

struct MainView: View {
    // MARK: - Properties
    @FirestoreQuery(collectionPath: "shop") var items: [ProductModel]
    var body: some View {
        List{
            ForEach(items) { item in
                HStack {
                    Text(item.name)
                    Spacer()
                    Text("\(item.price) грн")
                }
            }
        }
    }
}

#Preview {
    MainView()
}
