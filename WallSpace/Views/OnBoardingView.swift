//
//  OnBoardingView.swift
//  WallSpace
//
//  Created by WIN603 on 15/10/25.
//

import SwiftUI

struct OnBoardingView: View {
    var outDoorActivity: OutdoorActivity
    @Binding var isLast: Bool
    @AppStorage("isOnBoarding") var isOnBoarding:Bool = true
    var body: some View {
        ZStack {
            VStack(spacing:20){
                Image(outDoorActivity.image)
                    .resizable()
                    .scaledToFit()
                    .shadow(color: Color(red: 0, green: 0, blue: 0), radius: 3,x:2,y:2)
                Text(outDoorActivity.title)
                    .fontWeight(.heavy)
                    .font(.system(size: 42))
                    .foregroundColor(.black)
                Text(outDoorActivity.headline)
                    .fontWeight(.light)
                    .font(.system(size: 18))
                    .foregroundColor(.black)
                    .padding(.bottom,15)
                    .multilineTextAlignment(.center)
                if isLast {
                    ButtonView(onPress: {
                        withAnimation(.easeOut(duration: 0.5)) {
                            isOnBoarding = false
                        }
                    })
                }
            }
            .padding(.horizontal,15)
            .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .center)
            .background(
                LinearGradient(colors: outDoorActivity.gradientColors, startPoint: .top, endPoint: .bottom)
            )
        }
    }
}
