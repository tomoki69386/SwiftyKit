//
//  UIBarButtonItem+Extension.swift
//  SwiftyKit
//
//  Created by tomoki_sun on 2019/12/19.
//  Copyright © 2019 tomoki_sun. All rights reserved.
//

import UIKit

public extension UIBarButtonItem {
    class func createBackBarButtonItemForEmptyTitle() -> UIBarButtonItem {
        let backBarButtonItem = UIBarButtonItem()
        backBarButtonItem.title = " "
        return backBarButtonItem
    }
}
