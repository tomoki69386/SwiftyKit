//
//  BackingViewMaker.swift
//  SwiftyKit
//
//  Created by 築山朋紀 on 2019/12/27.
//  Copyright © 2019 tomoki_sun. All rights reserved.
//

import UIKit

public protocol ReusableViewType where Self: UIView {
    func prepareForReuse()
}
extension ReusableViewType {
    public static var reuseIdentifier: String {
        return String(describing: ObjectIdentifier(self).hashValue)
    }
}
public protocol BackingViewMaker {
    associatedtype View: ReusableViewType
    static func makeBackedView() -> View
}
