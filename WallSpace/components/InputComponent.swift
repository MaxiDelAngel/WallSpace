//
//  InputComponent.swift
//  WallSpace
//
//  Created by Angel Imanol on 08/10/25.
//

import SwiftUI

struct InputComponent: View {
    @Binding var text: String
    var placeholder: String
    var icon: String
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.gray)
                TextField(placeholder, text: $text)
                    .textFieldStyle(PlainTextFieldStyle())
            }
            .padding()
            .background(.surface)
            .cornerRadius(10)
            .padding(.horizontal)
        }.padding()
    }
}

#Preview {
    InputComponent(text: .constant(""), placeholder: "Buscar...", icon: "magnifyingglass")
}
