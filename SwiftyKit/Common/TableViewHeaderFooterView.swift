//
//  TableViewHeaderFooterView.swift
//  SwiftyKit
//
//  Created by 築山朋紀 on 2019/12/27.
//  Copyright © 2019 tomoki_sun. All rights reserved.
//

import UIKit

public class TableViewHeaderFooterView<Maker: BackingViewMaker>: UITableViewHeaderFooterView {
    public let backed: Maker.View
    public override init(reuseIdentifier: String?) {
        let backingView = Maker.makeBackedView()
        self.backed = backingView
        super.init(reuseIdentifier: reuseIdentifier)
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
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        backed.prepareForReuse()
    }
    
    internal func update(_ closure: ((Maker.View) -> Void)?) {
        if let closure = closure {
            closure(backed)
        }
    }
}

extension TableViewHeaderFooterView {
    public static func register(to tableView: UITableView) {
        tableView.register(TableViewHeaderFooterView<Maker>.self, forHeaderFooterViewReuseIdentifier: Maker.View.reuseIdentifier)
    }
    public static func dequeue(from tableView: UITableView, for indexPath: IndexPath, closure: ((Maker.View) -> Void)? = nil) -> TableViewHeaderFooterView {
        let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: Maker.View.reuseIdentifier) as! TableViewHeaderFooterView
        cell.update(closure)
        return cell
    }
}
