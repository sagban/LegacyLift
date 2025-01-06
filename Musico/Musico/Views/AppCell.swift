//
//  AppCell.swift
//  Musico
//
//  Created by Sagar Bansal on 1/6/25.
//


import SwiftUI

struct AppCell: View {
    var icon: Image
    var name: String
    var subtitle: String
    var buttonTitle: String
    var inAppPurchases: String
    
    var body: some View {
        HStack {
            icon
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 26, height: 26)
                .padding(.leading, 20)
                .padding(.top, 10)
                .padding(.bottom, 10)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(name)
                    .font(.system(size: 17, weight: .semibold))
                
                Text(subtitle)
                    .font(.system(size: 14))
                    .foregroundColor(Color(UIColor.systemGray))
            }
            .padding(.leading, 20)
            
            Spacer()
            
            VStack {
                Button(action: {
                    // Button action here
                }) {
                    Text(buttonTitle)
                        .font(.system(size: 14, weight: .bold))
                        .frame(width: 80, height: 31)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(15.5)
                }
                
                Text(inAppPurchases)
                    .font(.system(size: 8))
                    .foregroundColor(Color.white)
                    .padding(.top, 5)
            }
            .padding(.trailing, 20)
        }
        .frame(height: 80)
    }
}

struct AppCell_Previews: PreviewProvider {
    static var previews: some View {
        AppCell(
            icon: Image(systemName: "app.fill"),
            name: "App Name",
            subtitle: "App Subtitle",
            buttonTitle: "GET",
            inAppPurchases: "In-App Purchases"
        )
        .previewLayout(.sizeThatFits)
    }
}