//
//  Font + extension.swift
//  OnlineShop
//
//  Created by csd_setup on 05.08.2024.
//

import SwiftUI


extension Text{
    func titleFont() -> some View{
        self
            .foregroundStyle(.primary)
            .font(.system(size: 18, weight: .bold, design: .rounded))
            .opacity(0.8)
    }
    
    func subTitleFont() -> some View {
        self
            .foregroundStyle(.primary)
            .font(.system(size: 15, weight: .regular, design: .rounded))
            .opacity(0.8)
    }
}


struct FontView: View {
    var body: some View {
        VStack{
            Text("Title Font")
                .titleFont()
            Text("SubTitle Font")
                .subTitleFont()
        }
    }
}

#Preview {
    FontView()
}
