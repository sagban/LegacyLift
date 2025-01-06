//
//  GameOfTheDayView.swift
//  Musico
//
//  Created by Sagar Bansal on 1/6/25.
//


import SwiftUI

struct GameOfTheDayView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Image("TaylorSwiftIcon")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 460)
                .clipped()
            
            Text("ARTIST\nOF THE\nYEAR")
                .font(.system(size: 48, weight: .heavy))
                .foregroundColor(.white)
                .padding(.leading, 20)
                .padding(.top, -280)
            
            Text("Artist of the Year 2024")
                .font(.system(size: 17, weight: .bold))
                .padding(.leading, 20)
                .padding(.top, 20)
            
            Text("Won the 2024 MTV Video Music Award for Artist of the Year, her second consecutive win. She also won the top artist award at the 2024 Billboard Music Awards, breaking the record for the most wins in the award show's history.")
                .font(.system(size: 17, weight: .light))
                .padding(.horizontal, 20)
            
            Text("Swift is also the current holder of the American Music Award for Artist of the Year, with seven awards and nine nominations.")
                .font(.system(size: 17, weight: .light))
                .padding(.horizontal, 20)
                .padding(.top, 20)
            
            Spacer()
            
            VStack {
                AppCell(
                    icon: Image("TaylorSwiftIcon"),
                    name: "Taylor Swift",
                    subtitle: "A Quest for Forgiveness",
                    buttonTitle: "PLAY",
                    inAppPurchases: ""
                )
                .background(Color.clear)
                .padding(.horizontal, 20)
            }
            .background(BlurView(style: .systemUltraThinMaterialDark))
            .frame(height: 80)
        }
        .background(Color(UIColor.systemBackground))
        .edgesIgnoringSafeArea(.all)
    }
}

struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style

    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}

struct GameOfTheDayView_Previews: PreviewProvider {
    static var previews: some View {
        GameOfTheDayView()
    }
}