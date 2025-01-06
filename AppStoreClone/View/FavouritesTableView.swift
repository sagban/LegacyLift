import UIKit

struct Song {
    var name: String
    var subtitle: String
    var url: String
    
    init(_ name: String, _ subtitle: String, _ url: String) {
        self.name = name
        self.subtitle = subtitle
        self.url = url
    }
}

@IBDesignable class FavouritesTableView: UITableView {
    
//    typealias app = (name: String, subtitle: String, url: String)
    
    var isClipped = false
    
    private let cellId = "AppTableCell"
    private let apps: [Song] = [
        Song("Die With A Smile", "Lady Gaga, Bruno Mars", "https://i.scdn.co/image/ab67616d00001e0282ea2e9e1858aa012c57cd45"),
        Song("APT", "ROSÉ, Bruno Mars", "https://i.scdn.co/image/ab67616d00001e025074bd0894cb1340b8d8a678"),
        Song("BIRDS OF A FEATHER", "Billie Eilish", "https://i.scdn.co/image/ab67616d00001e0271d62ea7ea8a5be92d3c1f62"),
        Song("That’s So True", "Gracie Abrams", "https://i.scdn.co/image/ab67616d00001e021dac3694b3289cd903cb3acf"),
        Song("Who", "Jimin", "https://i.scdn.co/image/ab67616d00001e02f02c451189a709b9a952aaec"),
        Song("Espresso", "Sabrina Carpenter", "https://i.scdn.co/image/ab67616d00001e02fd8d7a8d96871e791cb1f626"),
        Song("luther (with sza)", "Kendrick Lamar, SZA", "https://i.scdn.co/image/ab67616d00001e0209d6ed214f03fbb663e46531"),
        Song("Sailor Song", "Gigi Perez", "https://i.scdn.co/image/ab67616d00001e02e6065f209e0a01986206bd53")
    ]
    
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setup()
    }
    
    required init?(coder: NSCoder) {
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
    }
}

extension FavouritesTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isClipped ? 4 : apps.count
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

extension FavouritesTableView: UITableViewDelegate {
    
}
