//
//  TableViewCell.swift
//  SwiftyKit
//
//  Created by 築山朋紀 on 2019/12/27.
//  Copyright © 2019 tomoki_sun. All rights reserved.
//

import UIKit

public final class TableViewCell<Maker: BackingViewMaker>: UITableViewCell {
    
    public let backed: Maker.View
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        let backingView = Maker.makeBackedView()
        self.backed = backingView
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backingView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(backingView)
        NSLayoutConstraint.activate([
            backingView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backingView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backingView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backingView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        backed.prepareForReuse()
    }
    
    public func update(_ closure: ((Maker.View) -> Void)?) {
        if let closure = closure {
            closure(backed)
        }
    }
}

extension TableViewCell {
    public static func register(to tableView: UITableView) {
        tableView.register(self, forCellReuseIdentifier: Maker.View.reuseIdentifier)
    }
    public static func dequeue(from tableView: UITableView, for indexPath: IndexPath, closure: ((Maker.View) -> Void)? = nil) -> TableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Maker.View.reuseIdentifier, for: indexPath) as! TableViewCell
        cell.update(closure)
        return cell
    }
}
