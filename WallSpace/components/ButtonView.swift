//
//  ButtonView.swift
//  WallSpace
//
//  Created by WIN603 on 15/10/25.
//

import SwiftUI

struct ButtonView: View {
    var onPress: ()->()
    var body: some View {
        Button{
            print("Button Pressed")
            onPress()
        }label: {
            HStack{
                Text("Iniciar").foregroundStyle(.black)
                Image(systemName: "arrow.forward.circle").foregroundStyle(.black)
            }
            .padding(.horizontal,25)
            .padding(.vertical,12)
            .background(
                Capsule().strokeBorder(lineWidth: 2)
            )
            .foregroundColor(Color("accent"))
            
        }.buttonStyle(.plain)
            .accentColor(.black)
    }
}
