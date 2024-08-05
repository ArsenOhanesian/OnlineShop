//
//  FavoritesButton.swift
//  OnlineShop
//
//  Created by csd_setup on 05.08.2024.
//

import SwiftUI

struct FavoritesButton: View {
    // MARK: - Body
    var body: some View {
        Image(systemName: Helper.Images.heart)
            .font(.title2)
    }
}

#Preview {
    FavoritesButton()
}
