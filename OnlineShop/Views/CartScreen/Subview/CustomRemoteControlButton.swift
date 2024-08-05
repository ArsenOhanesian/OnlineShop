//
//  CustomRemoteControlButton.swift
//  OnlineShop
//
//  Created by csd_setup on 05.08.2024.
//

import SwiftUI

struct CustomRemoteControlButton: View {
    // MARK: - Properties
    let name: String
    var size: Font = .title
    let action: () -> ()
   
    
    // MARK: - Body
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: name)
                .foregroundStyle(.primary)
                .font(size)
                
        }
        .buttonStyle(.plain)
    }
}

