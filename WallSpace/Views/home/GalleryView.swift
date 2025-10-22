//
//  GalleryView.swift
//  WallSpace
//
//  Created by Angel Imanol on 13/10/25.
//

import SwiftUI

struct GalleryView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var results: [Result] = []

    var body: some View {
        LazyVGrid(columns: columns, spacing: 12) {
            ForEach(results, id: \.id) { result in
                VStack {
                    AsyncImage(url: URL(string: result.urls.small)) { phase in
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
