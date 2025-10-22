//
//  OutdoorActivity.swift
//  WallSpace
//
//  Created by WIN603 on 15/10/25.
//

import Foundation
import SwiftUI

struct OutdoorActivity: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var gradientColors: [Color]
}
