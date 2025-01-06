import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            TodayView()
                .tabItem {
                    Image(systemName: "doc.text.image")
                    Text("Today")
                }
            
            ArtistsView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Artists")
                }
            
            AlbumsView()
                .tabItem {
                    Image(systemName: "rectangle.fill.on.rectangle.fill")
                    Text("Albums")
                }
            
            SongsView()
                .tabItem {
                    Image(systemName: "music.note")
                    Text("Songs")
                }
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
        }
    }
}

struct TodayView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("MONDAY 24 JANUARY")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(Color(white: 0.3333333333))
                    .padding(.top, 20)
                    .padding(.leading, 20)
                
                HStack {
                    Text("Today")
                        .font(.system(size: 31, weight: .bold))
                    
                    Spacer()
                    
                    Button(action: {
                        // Button action here
                    }) {
                        Image(systemName: "person.crop.circle")
                            .font(.system(size: 23))
                    }
                    .padding(.trailing, 20)
                }
                .padding(.leading, 20)
                
                CardView(embeddedView: ArticleView())
                    .frame(height: 390)
                    .padding(.horizontal, 20)
                
                CardView(embeddedView: FavouritesView())
                    .frame(height: 430)
                    .padding(.horizontal, 20)
                
                CardView(embeddedView: GameOfTheDayView())
                    .frame(height: 460)
                    .padding(.horizontal, 20)
                
                Spacer()
            }
            .background(Color(UIColor.systemBackground))
        }
        .background(Color(UIColor.systemBackground))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ArtistsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("OUR FAVOURITES")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(Color(white: 0.6666666667))
                .padding(.top, 20)
                .padding(.leading, 20)
            
            Text("Top Artists")
                .font(.system(size: 27, weight: .bold))
                .padding(.leading, 20)
            
            List {
                // Replace with your data and row content
                ForEach(0..<10) { index in
                    Text("Artist \(index + 1)")
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

struct AlbumsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("OUR FAVOURITES")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(Color(white: 0.6666666667))
                .padding(.top, 20)
                .padding(.leading, 20)
            
            Text("Top Album")
                .font(.system(size: 27, weight: .bold))
                .padding(.leading, 20)
            
            List {
                // Replace with your data and row content
                ForEach(0..<10) { index in
                    Text("Album \(index + 1)")
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

struct SongsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("OUR FAVOURITES")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(Color(white: 0.6666666667))
                .padding(.top, 20)
                .padding(.leading, 20)
            
            Text("Top Songs")
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

struct SearchView: View {
    var body: some View {
        VStack {
            Text("Search")
                .font(.largeTitle)
                .padding()
            
            Spacer()
        }
        .background(Color(UIColor.systemBackground))
        .edgesIgnoringSafeArea(.all)
    }
}

struct CardView<Content: View>: View {
    let embeddedView: Content
    
    var body: some View {
        embeddedView
            .background(Color(UIColor.systemBackground))
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}