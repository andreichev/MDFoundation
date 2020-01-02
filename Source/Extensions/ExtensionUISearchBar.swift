//
//  UISearchBarExtensions.swift
//  MD
//
//  Copyright © 2019 Itis. All rights reserved.
//

import UIKit

// MARK: - Properties

public extension UISearchBar {
    /// Text field inside search bar (if applicable).
    var textField: UITextField? {
        let subViews = subviews.flatMap { $0.subviews }
        guard let textField = (subViews.filter { $0 is UITextField }).first as? UITextField else {
            return nil
        }
        return textField
    }

    /// Text with no spaces or new lines in beginning and end (if applicable).
    var trimmedText: String? {
        return text?.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

// MARK: - Methods

public extension UISearchBar {
    /// Clear text.
    func clear() {
        text = ""
    }
}
