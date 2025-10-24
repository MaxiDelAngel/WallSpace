//
//  SearchObjetctController.swift
//  WallSpace
//
//  Created by Angel Imanol on 20/10/25.
//

import Foundation
import SwiftUI

class SearchObjetctController: ObservableObject{
    static let shared = SearchObjetctController()
    private init(){}

    var token = "a3udB5BdufW556mBjMAykF4uKowfCnRQn39bJk8IPJc"
    @Published var results = [Result]()
    @Published var searchText : String = "Wallapers"

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
       
    
}

