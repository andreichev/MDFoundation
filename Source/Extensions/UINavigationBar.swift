//
//  UINavigationBar.swift
//  MD
//
//  Created by Михаил Андреичев on 19/07/2019.
//  Copyright © 2019 Itis. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationBar {
    public func hideShadow(_ force: Bool) {
        shadowImage = force ? UIImage() : nil
    }

    public func makeTransparent(withTint tint: UIColor) {
        isTranslucent = true
        backgroundColor = .clear
        barTintColor = .clear
        setBackgroundImage(UIImage(), for: .default)
        tintColor = tint
        titleTextAttributes = [.foregroundColor: tint]
        shadowImage = UIImage()
    }
}
