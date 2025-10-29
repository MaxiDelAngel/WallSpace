//
//  BtnFavoritos.swift
//  WallSpace
//
//  Created by WIN603 on 24/10/25.
//

import SwiftUI

struct BtnFavoritos: View {
    var body: some View {
        
        HStack(spacing: 6) {
            Button {
            } label: {
                Image(systemName: "heart")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(8)
                    .background(Color.black.opacity(0.35))
                    .clipShape(Circle())
            }

            Button {
          
            } label: {
                Image(systemName: "arrow.down.circle")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(8)
                    .background(Color.black.opacity(0.35))
                    .clipShape(Circle())
            }
        }
        .padding(8)
    }
}

#Preview {
    BtnFavoritos()
}
