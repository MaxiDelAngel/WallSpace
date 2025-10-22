//
//  BoardingView.swift
//  WallSpace
//
//  Created by WIN603 on 15/10/25.
//

import SwiftUI

struct BoardingView: View {
    @AppStorage("isOnBoarding") var isOnBoarding: Bool = true
    @State private var currentIndex: Int = 0
    var body: some View {
        if isOnBoarding {
            TabView(selection: $currentIndex) {
                ForEach(0..<onboardingData.count, id: \.self) { index in
                    OnBoardingView(
                        outDoorActivity: onboardingData[index],
                        isLast: .constant(index == onboardingData.count - 1)
                    )
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        } else {
           HomeView()
        }
    }
}

#Preview {
    BoardingView()
}
