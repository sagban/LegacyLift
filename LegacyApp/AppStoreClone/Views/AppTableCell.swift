import UIKit

class AppTableCell: UITableViewCell {
    
    @IBOutlet private var iconView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var subtitleLabel: UILabel!
    
    
    func setup(icon: String, name: String, subtitle: String) {
        
        iconView.layer.cornerRadius = iconView.bounds.width / 4
        iconView.layer.borderWidth = 1
        iconView.layer.borderColor = CGColor(gray: 0.9, alpha: 1)
        
        nameLabel.text = name
        subtitleLabel.text = subtitle
        
        if let url = URL(string: icon) {
            getData(from: url) { data, response, error in
                guard let data = data, error == nil else { return }
                print(response?.suggestedFilename ?? url.lastPathComponent)
                print("Download Finished")
                // always update the UI from the main thread
                DispatchQueue.main.async() { [weak self] in
                    self?.iconView.image = UIImage(data: data)
                }
            }
        }
        
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}


