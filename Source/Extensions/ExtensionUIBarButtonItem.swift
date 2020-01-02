//
//  ExtensionUIBarButtonItem.swift
//  MD
//
//  Copyright © 2019 Itis. All rights reserved.
//

import UIKit

// MARK: - Methods

public extension UIBarButtonItem {
    /// Add Target to UIBarButtonItem
    ///
    /// - Parameters:
    ///   - target: target.
    ///   - action: selector to run when button is tapped.
    func addTargetForAction(_ target: AnyObject, action: Selector) {
        self.target = target
        self.action = action
    }
}
