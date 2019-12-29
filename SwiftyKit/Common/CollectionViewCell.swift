//
//  CollectionViewCell.swift
//  SwiftyKit
//
//  Created by 築山朋紀 on 2019/12/27.
//  Copyright © 2019 tomoki_sun. All rights reserved.
//

import UIKit

public final class CollectionViewCell<Maker: BackingViewMaker>: UICollectionViewCell {
    public let backed: Maker.View
    public override init(frame: CGRect) {
        let backingView = Maker.makeBackedView()
        self.backed = backingView
        super.init(frame: frame)
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

extension CollectionViewCell {
    public static func register(to collectionView: UICollectionView) {
        collectionView.register(self, forCellWithReuseIdentifier: Maker.View.reuseIdentifier)
    }
    public static func dequeue(from collectionView: UICollectionView, for indexPath: IndexPath, closure: ((Maker.View) -> Void)? = nil) -> CollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Maker.View.reuseIdentifier, for: indexPath) as! CollectionViewCell
        cell.update(closure)
        return cell
    }
}
