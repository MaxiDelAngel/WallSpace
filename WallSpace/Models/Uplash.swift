//
//  Result.swift
//  WallSpace
//
//  Created by Angel Imanol on 20/10/25.
//

import Foundation
import SwiftUI
struct Results : Codable{
    var total: Int
    var results: [Result]
}

struct Result : Codable{
    var id : String
    var description: String?
    var urls: URLs
}

struct URLs : Codable{
    var small : String
}
