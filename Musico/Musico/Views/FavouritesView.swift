import SwiftUI

struct FavouritesView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("OUR FAVOURITES")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(Color(white: 0.6666666667))
                .padding(.top, 20)
                .padding(.leading, 20)
            
            Text("Top Songs this week")
                .font(.system(size: 27, weight: .bold))
                .padding(.leading, 20)
            
            List {
                // Replace with your data and row content
                ForEach(0..<10) { index in
                    Text("Song \(index + 1)")
                        .frame(height: 80)
                }
            }
            .listStyle(PlainListStyle())
            .padding(.horizontal, 20)
        }
        .background(Color(UIColor.systemBackground))
        .edgesIgnoringSafeArea(.all)
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
    }
}