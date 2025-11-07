//
//  FavScreen.swift
//  WallSpace
//
//  Created by WIN603 on 05/11/25.
//

import SwiftUI

struct FavScreen: View {
    @ObservedObject var searchObject = SearchObjetctController.shared
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            if searchObject.favorites.isEmpty {
                VStack(spacing: 12) {
                    Image(systemName: "heart.slash")
                        .font(.system(size: 50))
                        .foregroundColor(.gray.opacity(0.6))
                    Text("Aún no tienes favoritos")
                        .font(.headline)
                        .foregroundColor(.gray)
                }
                .padding()
            } else {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 12) {
                        ForEach(searchObject.favorites, id: \.self) { imageURL in
                            ZStack(alignment: .topTrailing) {
                                AsyncImage(url: URL(string: imageURL)) { phase in
                                    switch phase {
                                    case .empty:
                                        Color(.systemGray5)
                                            .overlay(ProgressView())
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .overlay(
                                                BtnFavoritos(imageURL: imageURL)
                                            )
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
                .navigationTitle("Favoritos ❤️")
            }
        }
    }
}

#Preview {
    FavScreen()
}
