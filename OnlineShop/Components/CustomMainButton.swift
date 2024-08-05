//
//  CustomMainButton.swift
//  OnlineShop
//
//  Created by csd_setup on 05.08.2024.
//

import SwiftUI

struct CustomMainButton: View {
    // MARK: - Properties
    var title: String
    var action: () -> ()
    
    // MARK: - Body
    var body: some View {
        Button(action: action, label: {
            Text(title)
                .frame(maxWidth: .infinity)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .padding()
                .background(.black)
                .clipShape(Capsule())
                .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y: 8)
        })
    }
}

#Preview {
    CustomMainButton(title: "CustomButton", action: {})
}
