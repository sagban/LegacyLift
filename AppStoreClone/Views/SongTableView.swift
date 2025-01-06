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
        self.apps = []
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
