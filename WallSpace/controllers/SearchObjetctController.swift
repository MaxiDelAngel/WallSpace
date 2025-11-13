//
//  SearchObjetctController.swift
//  WallSpace
//
//  Created by Angel Imanol on 20/10/25.
//

import Foundation
import SwiftUI
import UIKit

class SearchObjetctController: ObservableObject{
    static let shared = SearchObjetctController()
    private init(){
        loadFavorites()
    }
    
    var token = "a3udB5BdufW556mBjMAykF4uKowfCnRQn39bJk8IPJc"
    @Published var results = [Result]()
    @Published var searchText : String = "Wallapers"
    @Published var favorites: [String] = []

    func search(){
        // Codificar el texto de búsqueda para URL
        guard let encodedQuery = searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: "https://api.unsplash.com/search/photos?query=\(encodedQuery)") else {
            return
        }

        
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Client-ID \(token)", forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: request) { (data, res, error) in
            guard let data = data else { return }
            do{
                let res = try JSONDecoder().decode(Results.self, from: data)
                DispatchQueue.main.async {
                    self.results = res.results  // Reemplazar en vez de append
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    func emptySearch(){
        searchText = "Random"
        guard let encodedQuery = searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: "https://api.unsplash.com/search/photos?query=\(encodedQuery)") else {
            return
        }

        
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Client-ID \(token)", forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: request) { (data, res, error) in
            guard let data = data else { return }
            do{
                let res = try JSONDecoder().decode(Results.self, from: data)
                DispatchQueue.main.async {

                    self.results = res.results  // Reemplazar en vez de append

                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }

    
    func downloadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data,
                  let image = UIImage(data: data) else { return }
            

            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }.resume()
    }
    

    func addToFavorites(_ imageURL: String) {
        if !favorites.contains(imageURL) {
            favorites.append(imageURL)
            saveFavorites()
        }
    }
    
    func removeFromFavorites(_ imageURL: String) {
        favorites.removeAll { $0 == imageURL }
        saveFavorites()
    }
    
    func toggleFavorite(_ imageURL: String) {
        if favorites.contains(imageURL) {
            removeFromFavorites(imageURL)
        } else {
            addToFavorites(imageURL)
        }
    }
    
    private func saveFavorites() {
        UserDefaults.standard.set(favorites, forKey: "Favorites")
    }
    
    private func loadFavorites() {
        if let saved = UserDefaults.standard.array(forKey: "Favorites") as? [String] {
            favorites = saved
        }
    }
    
}

