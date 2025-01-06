//
//  ArticleView.swift
//  Musico
//
//  Created by Sagar Bansal on 1/6/25.
//


import SwiftUI

struct ArticleView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("TRY NOW")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color(white: 0.6666666667))
                    .padding(.top, 20)
                    .padding(.leading, 20)
                
                Text("Sleep better with music")
                    .font(.system(size: 27, weight: .bold))
                    .padding(.leading, 20)
                
                Image("Sleep")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 250)
                    .padding(.horizontal, 20)
                
                Text("The Importance of Sleep Songs for Restful Nights")
                    .font(.system(size: 17, weight: .light))
                    .padding(.leading, 20)
                
                Text("The Modern Struggle for Sleep")
                    .font(.system(size: 17, weight: .bold))
                    .padding(.leading, 20)
                
                Text("In today’s fast-paced world, restful sleep often feels out of reach. The mind is flooded with worries, screens disrupt our natural rhythms, and stress keeps the body on high alert. These challenges have made sleeplessness a common issue, impacting health, mood, and productivity.")
                    .font(.system(size: 17, weight: .light))
                    .padding(.horizontal, 20)
                
                Text("Music as a Pathway to Better Sleep")
                    .font(.system(size: 17, weight: .bold))
                    .padding(.leading, 20)
                
                Text("Sleep songs are more than just melodies—they’re a pathway to better health. By combining calming instruments, ambient sounds, and frequencies scientifically linked to restorative sleep, these songs promote a state of tranquility that can improve sleep quality over time. Whether it’s the gentle hum of a lullaby or the rhythmic sway of ocean waves, the right music can help anyone drift off more easily, stay asleep longer, and wake up feeling refreshed.")
                    .font(.system(size: 17, weight: .light))
                    .padding(.horizontal, 20)
                
                Text("Personalizing the Sleep Experience")
                    .font(.system(size: 17, weight: .bold))
                    .padding(.leading, 20)
                
                Text("Sleep songs also offer a personalized touch to bedtime routines. Everyone has unique preferences, and the ability to choose from instrumental tracks, nature-inspired melodies, or meditative soundscapes empowers individuals to curate a sleep experience that works best for them.")
                    .font(.system(size: 17, weight: .light))
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
            }
            .background(Color(UIColor.systemBackground))
        }
        .background(Color(UIColor.systemBackground))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView()
    }
}