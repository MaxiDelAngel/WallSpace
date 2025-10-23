//
//  HomeView.swift
//  WallSpace
//
//  Created by Angel Imanol on 08/10/25.
//

import SwiftUI


struct HomeView: View {
    @State private var selectedTopic = "Todos"
    @ObservedObject var SearchObjetct = SearchObjetctController.shared
    

    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    InputComponent(text: $SearchObjetct.searchText, placeholder: "Buscar..", icon: "magnifyingglass")
                        .onSubmit {
                            SearchObjetct.search()
                            if SearchObjetct.searchText == ""  {
                                SearchObjetct.emptySearch()
                                SearchObjetct.searchText = ""
                                    
                            }
                        }
                    FilterView(selectedTopic: $selectedTopic)
                    
                    
                    GalleryView(results: SearchObjetct.results)
                }
               
                .padding(.top)
               
            }
            .navigationTitle("WallSpace")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarBackButtonHidden(true)
        }
        .onAppear(){
            SearchObjetct.search()
        }
    }
}

#Preview {
    HomeView()
}
