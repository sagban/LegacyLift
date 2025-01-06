//
//  SongTableView.swift
//  AppStoreClone
//
//  Created by Sagar Bansal on 1/5/25.
//

import UIKit

@IBDesignable class SongTableView: UITableView {
    private var apps: [Song]
    @IBInspectable private var vwType: String
    private let cellId = "AppTableCell"
    
    init(frame: CGRect, style: UITableView.Style, vwType: String) {
        self.apps = []
        self.vwType = vwType
        super.init(frame: frame, style: style)
        setup()
    }
    
    required init?(coder: NSCoder) {
        self.apps = []
        self.vwType = ""
        super.init(coder: coder)
        setup()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    
    private func setup() {
        let bundle = Bundle(for: type(of: self))
        let cellNib = UINib(nibName: cellId, bundle: bundle)
        register(cellNib, forCellReuseIdentifier: cellId)
        
        dataSource = self
        delegate = self
        fetch()
    }
    
    private func fetch(){
        
        self.apps = [
            Song("Blinding Lights", "The Weeknd", "https://open.spotify.com/track/0VjIjW4GlUZAMYd2vXMi3b"),
            Song("Shape of You", "Ed Sheeran", "https://open.spotify.com/track/7qiZfU4dY1lWllzX7mPBI3"),
            Song("Someone You Loved", "Lewis Capaldi", "https://open.spotify.com/track/2TIlqbInePUpWP7m0TxLgc"),
            Song("As It Was", "Harry Styles", "https://open.spotify.com/track/4LRPiXqCikLlN15cENXs0t"),
            Song("Starboy", "The Weeknd ft. Daft Punk", "https://open.spotify.com/track/5aAx2yezTd8zXrkmtKl66B"),
            Song("Sunflower", "Post Malone & Swae Lee", "https://open.spotify.com/track/0RiRZpuVRbi7oqRdSMwhQY"),
            Song("One Dance", "Drake ft. Wizkid & Kyla", "https://open.spotify.com/track/1xznGGDReH1oQq0xzbwXa3"),
            Song("Sweater Weather", "The Neighbourhood", "https://open.spotify.com/track/2QjOHCTQ1Jl3zawyYOqyFw"),
            Song("Stay", "The Kid LAROI & Justin Bieber", "https://open.spotify.com/track/5HCyWlXZPP0y6Gqq8TgA20"),
            Song("Believer", "Imagine Dragons", "https://open.spotify.com/track/0pqnGHJpmpxLKifKRmU6WP"),
            Song("Heat Waves", "Glass Animals", "https://open.spotify.com/track/3USxtqRwSYz57Ewm6wWRMp"),
            Song("Perfect", "Ed Sheeran", "https://open.spotify.com/track/0tgVpDi06FyKpA1z0VMD4v"),
            Song("Dance Monkey", "Tones And I", "https://open.spotify.com/track/2XU0oxnqUiGlf2ufW8sfpW"),
            Song("Lovely", "Billie Eilish & Khalid", "https://open.spotify.com/track/0u2P5u6lvoDfwTYjAADbn4"),
            Song("Say You Won't Let Go", "James Arthur", "https://open.spotify.com/track/5uCax9HTNlzGybIStD3vDh"),
            Song("Rockstar", "Post Malone ft. 21 Savage", "https://open.spotify.com/track/0e7ipj03S05BNilyu5bRzt"),
            Song("Closer", "The Chainsmokers ft. Halsey", "https://open.spotify.com/track/7BKLCZ1jbUBVqRi2FVlTVw"),
            Song("Something Just Like This", "The Chainsmokers & Coldplay", "https://open.spotify.com/track/6RUKPb4LETWmmr3iAEQktW"),
            Song("Riptide", "Vance Joy", "https://open.spotify.com/track/7yq4Qj7cqayVTp3FF9CWbm"),
            Song("Watermelon Sugar", "Harry Styles", "https://open.spotify.com/track/6UelLqGlWMcVH1E5c4H7lY"),
            Song("Señorita", "Shawn Mendes & Camila Cabello", "https://open.spotify.com/track/0TK2YIli7K1leLovkQiNik"),
            Song("Take Me To Church", "Hozier", "https://open.spotify.com/track/6UelLqGlWMcVH1E5c4H7lY"),
            Song("Another Love", "Tom Odell", "https://open.spotify.com/track/3JvKfv6T31zO0ini8iNItO"),
            Song("Don't Start Now", "Dua Lipa", "https://open.spotify.com/track/6WrI0LAC5M1Rw2MnX2ZvEg"),
            Song("Counting Stars", "OneRepublic", "https://open.spotify.com/track/2tpWsVSb9UEmDRxAl1zhX1"),
            Song("Photograph", "Ed Sheeran", "https://open.spotify.com/track/6fxVffaTuwjgEk5h9QyRjy"),
            Song("Bohemian Rhapsody", "Queen", "https://open.spotify.com/track/3z8h0TU7ReDPLIbEnYhWZb"),
            Song("Thunder", "Imagine Dragons", "https://open.spotify.com/track/1zB4vmk8tFRmM9UULNzbLB"),
            Song("Bad Guy", "Billie Eilish", "https://open.spotify.com/track/2Fxmhks0bxGSBdJ92vM42m"),
            Song("Old Town Road", "Lil Nas X", "https://open.spotify.com/track/7hDVYcQq6MxkdJGweuJjnb"),
            Song("All Of Me", "John Legend", "https://open.spotify.com/track/3U4isOIWM3VvDubwSI3y7a"),
            Song("Lucid Dreams", "Juice WRLD", "https://open.spotify.com/track/1TYgIpt6ZaXmbcpkkBxgLG"),
            Song("Circles", "Post Malone", "https://open.spotify.com/track/21jGcNKet2qwijlDFuPiPb"),
            Song("Thinking out Loud", "Ed Sheeran", "https://open.spotify.com/track/1Slwb6dOYkBlWal1PGtnNg"),
            Song("The Hills", "The Weeknd", "https://open.spotify.com/track/7fBv7CLKzipRk6EC6TWHOB"),
            Song("God's Plan", "Drake", "https://open.spotify.com/track/6DCZcSspjsKoFjzjrWoCdn"),
            Song("Shallow", "Lady Gaga & Bradley Cooper", "https://open.spotify.com/track/2VxeLyX666F8uXCJ0dZF8B"),
            Song("That's What I Like", "Bruno Mars", "https://open.spotify.com/track/0KKkJNfGyhkQ5aFogxQAPU"),
            Song("Let Me Love You", "DJ Snake ft. Justin Bieber", "https://open.spotify.com/track/4pdPtRcBmOSQDlJ3p6QwQn"),
            Song("Love Yourself", "Justin Bieber", "https://open.spotify.com/track/3U4isOIWM3VvDubwSI3y7a"),
            Song("Let Her Go", "Passenger", "https://open.spotify.com/track/2jyjhRf6DVbMPUunCqOREO"),
            Song("Wake Me Up", "Avicii ft. Aloe Blacc", "https://open.spotify.com/track/0nrRP2bk19rDB0gNHuzlpW"),
            Song("Unforgettable", "French Montana ft. Swae Lee", "https://open.spotify.com/track/1pb43zL4EX5yh2wxZW9jmN"),
            Song("Bad Habits", "Ed Sheeran", "https://open.spotify.com/track/6PQ88X9TkUIAUIZJHW2upE"),
            Song("Don't Be Shy", "Tiësto & Karol G", "https://open.spotify.com/track/0bI7K9Becu2dtXK1Q3cZNB"),
            Song("Cold Heart (Pnau Remix)", "Elton John & Dua Lipa", "https://open.spotify.com/track/6zSpb8dQRaw0M1dK8PBwQz"),
            Song("good 4 u", "Olivia Rodrigo", "https://open.spotify.com/track/4ZtFanR9U6ndgddUvNcjcG"),
            Song("Levitating", "Dua Lipa", "https://open.spotify.com/track/39LLxExYz6ewLAcYrzQQyP"),
            Song("Save Your Tears", "The Weeknd", "https://open.spotify.com/track/5QO79kh1waicV47BqGRL3g"),
            Song("MONTERO (Call Me By Your Name)", "Lil Nas X", "https://open.spotify.com/track/67BtfxlNbhBmCDR2L2l8qd"),
            Song("drivers license", "Olivia Rodrigo", "https://open.spotify.com/track/7lPN2DXiMsVn7XUKtOW1CS"),
            Song("INDUSTRY BABY", "Lil Nas X & Jack Harlow", "https://open.spotify.com/track/27NovPIUIRrOZoCHxABJwK"),
            Song("abcdefu", "GAYLE", "https://open.spotify.com/track/4fouWK6XVHhzl78KzQ1UjL"),
            Song("STAY (with Justin Bieber)", "The Kid LAROI", "https://open.spotify.com/track/5PjdY0CKGZdEuoNab3yDmX"),
        ]
    }
}

extension SongTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: cellId) as! AppTableCell
        let app = apps[indexPath.row]
        let icon = app.url
        cell.setup(icon: icon, name: app.name, subtitle: app.subtitle)
        let endIndex = tableView.numberOfRows(inSection: indexPath.section) - 1
        if indexPath.row == endIndex {
            cell.separatorInset = UIEdgeInsets(top: 0, left: UIScreen.main.bounds.width, bottom: 0, right: 0)
        }
        return cell
    }
}

extension SongTableView: UITableViewDelegate {
    
}
