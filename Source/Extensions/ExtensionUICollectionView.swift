//
//  ExtensionUICollectionView.swift
//  MD
//

import UIKit

extension UICollectionView {
    public func registerCell<T: UICollectionViewCell>(ofType type: T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.identifier)
    }

    public func dequeueReusableCell<T: UICollectionViewCell>(
        _ type: T.Type, for indexPath: IndexPath
    ) -> T {
        guard let cell = dequeueReusableCell(
            withReuseIdentifier: T.identifier,
            for: indexPath
        ) as? T else {
            fatalError("Unable to dequeue cell with identifier: \(T.identifier)")
        }
        return cell
    }

    public func dequeueReusableSupplementaryView<T: UICollectionReusableView>(
        _ type: T.Type, for indexPath: IndexPath
    ) -> T {
        guard let supplementaryView = dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: T.identifier,
            for: indexPath
        ) as? T else {
            fatalError("Unable to dequeue supplementary view with identifier: \(T.identifier)")
        }
        return supplementaryView
    }

    public func dequeueReusableSupplementaryFooterView<T: UICollectionReusableView>(
        _ type: T.Type, for indexPath: IndexPath
    ) -> T {
        guard let supplementaryView = dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: T.identifier,
            for: indexPath
        ) as? T else {
            fatalError("Unable to dequeue supplementary view with identifier: \(T.identifier)")
        }
        return supplementaryView
    }

    public func registerSupplementaryHeaderView<T: UICollectionReusableView>(
        ofType type: T.Type
    ) {
        register(
            T.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: T.identifier
        )
    }

    public func registerSupplementaryFooterView<T: UICollectionReusableView>(
        ofType type: T.Type
    ) {
        register(
            T.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: T.identifier
        )
    }
}
