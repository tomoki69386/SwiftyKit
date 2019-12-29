//
//  NibInitializable.swift
//  SwiftyKit
//
//  Created by tomoki_sun on 2019/12/19.
//  Copyright © 2019 tomoki_sun. All rights reserved.
//

import UIKit

public protocol NibInitializable { }

public extension NibInitializable where Self: UIView {
    public static func loadFromNib(index: Int = 0) -> Self {
        guard let view = UINib(nibName: String(describing: self), bundle: nil).instantiate(withOwner: self, options: nil)[index] as? Self else {
            fatalError("Invalid Nib name")
        }
        return view
    }
    
    public static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}

extension UIView: NibInitializable { }
