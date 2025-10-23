//
//  FilterView.swift
//  WallSpace
//
//  Created by Angel Imanol on 08/10/25.
//

import SwiftUI

struct FilterView: View {
    @Binding var selectedTopic: String
    @ObservedObject var SearchObjetct = SearchObjetctController.shared

    let topics = [
        "Todos",
        "Wallpapers",
        "Nature",
        "Architecture",
        "Animals",
        "Arts & Culture",
        "Textures & Patterns",
        "Street Photography",
        "Travel",
        "Film",
        "Experimental"
    ]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(topics, id: \.self) { topic in
                    Text(topic)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(selectedTopic == topic ? .accentText : .base)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(selectedTopic == topic ? .accent : .surface)
                        .cornerRadius(20)
                        .onTapGesture {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                
                                selectedTopic = topic
                                SearchObjetct.searchText=selectedTopic
                                SearchObjetct.search()

                            }
                        }
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    FilterView(selectedTopic: .constant("Todos"))
}
