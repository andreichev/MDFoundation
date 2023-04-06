//
//  ExtensionUITableView.swift
//  MD
//

import UIKit

extension UITableView {
    public func registerCell<T: UITableViewCell>(ofType type: T.Type) {
        register(T.self, forCellReuseIdentifier: T.identifier)
    }

    public func registerHeaderFooter<T: UITableViewHeaderFooterView>(ofType type: T.Type) {
        register(T.self, forHeaderFooterViewReuseIdentifier: T.identifier)
    }

    public func dequeueReusableCell<T: UITableViewCell>(
        _ type: T.Type, for indexPath: IndexPath
    ) -> T {
        guard let cell = dequeueReusableCell(
            withIdentifier: T.identifier,
            for: indexPath
        ) as? T else {
            fatalError("Unable to dequeue cell with identifier: \(T.identifier)")
        }
        return cell
    }

    public func dequeueHeaderFooter<T: UITableViewHeaderFooterView>(_ type: T.Type) -> T {
        guard let view = dequeueReusableHeaderFooterView(
            withIdentifier: T.identifier
        ) as? T else {
            fatalError("Unable to dequeue header/footer view with identifier: \(T.identifier)")
        }
        return view
    }
}
