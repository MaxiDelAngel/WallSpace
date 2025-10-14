//
//  ContentView.swift
//  WallSpace
//
//  Created by WIN603 on 26/09/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            
            HomeView()
            
                .tabItem {
                    
                    Label("Home", systemImage: "house")
                    
                }
            
            Text("Categorias")
            
                .tabItem {
                    
                    Image(systemName: "rectangle.grid.3x1")
                    
                    Text("Categorias")
                    
                }
            Text("Favoritos")
            
                .tabItem {
                    
                    Image(systemName: "heart.circle")
                    
                    Text("Favoritos")
                    
                }
            
        }.accentColor(.accent)
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
            .onAppear {
                let appearance = UITabBarAppearance()
                appearance.configureWithDefaultBackground()
                
                appearance.stackedLayoutAppearance.normal.iconColor = .red
                appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.base]
                UITabBar.appearance().standardAppearance = appearance
                UITabBar.appearance().scrollEdgeAppearance = appearance
            }
    }
}

#Preview {
    ContentView()
}
