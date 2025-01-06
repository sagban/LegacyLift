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

class FavouritesView: UIView, ClippableView {
    
    var isClipped: Bool = false
    
    @IBOutlet private var favouritesTable: FavouritesTableView!
    
    
    func clip() {
        isClipped = false
        favouritesTable.isClipped = true
    }
}
