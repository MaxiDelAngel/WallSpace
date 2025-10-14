//
//  HomeView.swift
//  WallSpace
//
//  Created by Angel Imanol on 08/10/25.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    @State private var selectedTopic = "Todos"
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    InputComponent(text: $searchText, placeholder: "Buscar..", icon: "magnifyingglass")
                    FilterView(selectedTopic: $selectedTopic)
                    GalleryView()
                    
                }
                .padding(.top)
            }
            .navigationTitle("WallSpace")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    HomeView()
}
