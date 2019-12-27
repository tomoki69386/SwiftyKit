//
//  CollectionReusableView.swift
//  SwiftyKit
//
//  Created by 築山朋紀 on 2019/12/27.
//  Copyright © 2019 tomoki_sun. All rights reserved.
//

import UIKit

public enum CollectionViewSupplementaryKind {
    case header
    case footer

    var rawValue: String {
        switch self {
        case .header:
            return UICollectionView.elementKindSectionHeader
        case .footer:
            return UICollectionView.elementKindSectionFooter
        }
    }
}

public class CollectionReusableView<Maker: BackingViewMaker>: UICollectionReusableView {
    public let backed: Maker.View
    public override init(frame: CGRect) {
        let backingView = Maker.makeBackedView()
        self.backed = backingView
        super.init(frame: frame)
        backingView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(backingView)
        NSLayoutConstraint.activate([
            backingView.topAnchor.constraint(equalTo: topAnchor),
            backingView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backingView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backingView.bottomAnchor.constraint(equalTo: bottomAnchor)
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
    
    internal func update(_ closure: ((Maker.View) -> Void)?) {
        if let closure = closure {
            closure(backed)
        }
    }
}

extension CollectionReusableView {
    public static func register(to collectionView: UICollectionView, for kind: CollectionViewSupplementaryKind) {
        collectionView.register(self, forSupplementaryViewOfKind: kind.rawValue, withReuseIdentifier: Maker.View.reuseIdentifier)
    }
    public static func dequeue(from collectionView: UICollectionView, for indexPath: IndexPath, ofKind kind: CollectionViewSupplementaryKind, closure: ((Maker.View) -> Void)? = nil) -> CollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind.rawValue, withReuseIdentifier: Maker.View.reuseIdentifier, for: indexPath) as! CollectionReusableView
        view.update(closure)
        return view
    }
}
