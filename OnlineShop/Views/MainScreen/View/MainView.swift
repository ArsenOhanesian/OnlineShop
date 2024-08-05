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
    @FirestoreQuery(collectionPath: Helper.Firebase.shop) var items: [ProductModel]
    @EnvironmentObject var vm: ViewModel
    var columns = Array(repeating: GridItem(), count: 2)
    
    private let hPadding: CGFloat = 10
    
    // MARK: - Body
    var body: some View {
        NavigationStack{
            ScrollView(.vertical, showsIndicators: false){
                LazyVGrid(columns: columns) {
                    ForEach(items) { item in
                        NavigationLink(destination: DetailView(product: item)) {
                            ProductCardView(product: item)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .padding(.horizontal, hPadding)
            .background(.secondary.opacity(0.3))
            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: 8, x: 5, y: 8)
            
            // MARK: - Navigation Bar
            .navigationTitle(Helper.Titles.main)
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink(destination: FavoritesView()) {
                        FavoritesButton()
                    }
                    .buttonStyle(.plain)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: CartView()) {
                        CartButton(numberOfProducts: vm.cartItemCount)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        
        
    }
}

#Preview {
    MainView()
        .environmentObject(ViewModel())
}
