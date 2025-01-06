import SwiftUI

struct AppTableCell: View {
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
                .frame(width: 60, height: 60)
                .padding(.leading, 10)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(name)
                    .font(.system(size: 17))
                
                Text(subtitle)
                    .font(.system(size: 14))
                    .foregroundColor(Color(UIColor.systemGray))
                
                Spacer()
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
                        .background(Color(UIColor.systemGray))
                        .foregroundColor(.white)
                        .cornerRadius(15.5)
                }
                
                Text(inAppPurchases)
                    .font(.system(size: 8))
                    .foregroundColor(Color(UIColor.systemGray))
                    .padding(.top, 5)
            }
            .padding(.trailing, 10)
        }
        .frame(height: 80)
    }
}

struct AppTableCell_Previews: PreviewProvider {
    static var previews: some View {
        AppTableCell(
            icon: Image(systemName: "app.fill"),
            name: "App Name",
            subtitle: "App Subtitle",
            buttonTitle: "Play",
            inAppPurchases: "In-App Purchases"
        )
        .previewLayout(.sizeThatFits)
    }
}