//
//  TableViewController.swift
//  Example
//
//  Created by 築山朋紀 on 2019/12/20.
//  Copyright © 2019 tomoki_sun. All rights reserved.
//

import UIKit
import SwiftyKit

final class CommonView: UIView, BackingViewMaker, ReusableViewType {
    typealias View = CommonView
    
    let textLabel = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        textLabel.textAlignment = .center
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: topAnchor),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            textLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            textLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 44)
        ])
    }
    
    static func makeBackedView() -> CommonView {
        return CommonView()
    }
    
    func prepareForReuse() {
        textLabel.text = ""
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class TableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableViewCell<CommonView>.register(to: tableView)
    }
    
    enum Section: Int, CaseIterable, TableSection {
        case left, center, right
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return Section.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Section(indexPath.section) {
        case .left:
            return TableViewCell<CommonView>.dequeue(from: tableView, for: indexPath) { view in
                view.textLabel.textAlignment = .left
                view.textLabel.text = "\(indexPath.section): \(indexPath.row)"
            }
        case .center:
            return TableViewCell<CommonView>.dequeue(from: tableView, for: indexPath) { view in
                view.textLabel.text = "\(indexPath.section): \(indexPath.row)"
            }
        case .right:
            return TableViewCell<CommonView>.dequeue(from: tableView, for: indexPath) { view in
                view.textLabel.textAlignment = .right
                view.textLabel.text = "\(indexPath.section): \(indexPath.row)"
            }
        }
    }
}
