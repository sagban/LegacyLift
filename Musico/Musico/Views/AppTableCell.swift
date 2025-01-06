import SwiftUI

struct AppTableCellView: View {
    var icon: String
    var name: String
    var subtitle: String
    
    @State private var iconImage: UIImage? = nil
    
    var body: some View {
        HStack {
            if let iconImage = iconImage {
                Image(uiImage: iconImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.gray.opacity(0.9), lineWidth: 1)
                    )
                    .padding(.leading, 20)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 60, height: 60)
                    .cornerRadius(15)
                    .padding(.leading, 20)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
            }
            
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
                    Text("Play")
                        .font(.system(size: 14, weight: .bold))
                        .frame(width: 80, height: 31)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(15.5)
                }
                
                Text("In-App Purchases")
                    .font(.system(size: 8))
                    .foregroundColor(Color(UIColor.systemGray))
                    .padding(.top, 5)
            }
            .padding(.trailing, 20)
        }
        .frame(height: 80)
        .onAppear {
            loadImage(from: icon)
        }
    }
    
    private func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self.iconImage = UIImage(data: data)
            }
        }.resume()
    }
}

struct AppTableCellView_Previews: PreviewProvider {
    static var previews: some View {
        AppTableCellView(icon: "https://example.com/icon.png", name: "App Name", subtitle: "App Subtitle")
            .previewLayout(.sizeThatFits)
    }
}
