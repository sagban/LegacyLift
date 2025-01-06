import SwiftUI

struct AppCell: View {
    var body: some View {
        HStack {
            Image(systemName: "app.fill") // Placeholder for iconView
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(10)
                .padding(.leading, 10)
            
            VStack(alignment: .leading) {
                Text("App Name") // Placeholder for nameLabel
                    .font(.headline)
                Text("In-App Purchases") // Placeholder for subtitleLabel
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.leading, 10)
            
            Spacer()
            
            Button(action: {
                // Action for button
            }) {
                Text("GET")
                    .font(.system(size: 14, weight: .bold))
                    .frame(width: 80, height: 31)
                    .background(Color.white)
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.gray, lineWidth: 1)
                    )
            }
            .padding(.trailing, 10)
        }
        .frame(height: 80)
    }
}

struct AppCell_Previews: PreviewProvider {
    static var previews: some View {
        AppCell()
            .previewLayout(.sizeThatFits)
    }
}