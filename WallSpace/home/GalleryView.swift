//
//  GalleryView.swift
//  WallSpace
//
//  Created by Angel Imanol on 13/10/25.
//

import SwiftUI

struct GalleryView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    let mockImages = [
        "https://images.unsplash.com/photo-1557683316-973673baf926",
        "https://images.unsplash.com/photo-1506905925346-21bda4d32df4",
        "https://images.unsplash.com/photo-1480714378408-67cf0d13bc1b",
        "https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba",
        "https://images.unsplash.com/photo-1419242902214-272b3f66ee7a",
        "https://images.unsplash.com/photo-1558591710-4b4a1ae0f04d",
        "https://images.unsplash.com/photo-1441974231531-c6227db76b6e",
        "https://images.unsplash.com/photo-1449824913935-59a10b8d2000",
        "https://images.unsplash.com/photo-1587300003388-59208cc962cb",
        "https://images.unsplash.com/photo-1462331940025-496dfbfc756"
    ]
    var body: some View {
        LazyVGrid(columns: columns, spacing: 12) {
            ForEach(mockImages.indices, id: \.self) { index in
                VStack {
                    AsyncImage(url: URL(string: mockImages[index])) { phase in
                        switch phase {
                        case .empty:
                            Color(.systemGray5)
                                .overlay(ProgressView())
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                        case .failure:
                            Color(.systemGray5)
                                .overlay(
                                    Image(systemName: "photo")
                                        .foregroundColor(.gray)
                                )
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
                .frame(width: 180, height: 240)
                .clipped()
                .cornerRadius(16)
                .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    GalleryView()
}
