//
//  XibInitializer.swift
//  MDFoundation
//
//  Created by Михаил Андреичев on 06.12.2019.
//

import UIKit

public class XibInitializer {
    /// Init from bundle to owner. Bundle base on type
    public static func initXib<T: NSObject>(_ xibName: String? = nil, owner: T) -> UIView {
        let name = xibName ?? Utils.getClassName(T.self)
        let topLevelObjects = UINib(
            nibName: name,
            bundle: Bundle(for: T.self)
        ).instantiate(withOwner: owner, options: nil)
        guard let object = topLevelObjects.first as? UIView
        else { fatalError("No xib file or wrong structure") }
        return object
    }

    /// Load from bundle, base on type
    public static func loadFromXib<T: UIView>(_ xibName: String? = nil, type: T.Type) -> T {
        let name = xibName ?? Utils.getClassName(type)
        return loadFromXib(xibName: name, type: type)
    }

    private static func loadFromXib<T: UIView>(xibName: String, type: T.Type) -> T {
        guard
            let topLevelObjects = Bundle(for: T.self).loadNibNamed(xibName, owner: nil, options: nil),
            let object = topLevelObjects.first as? T
        else {
            fatalError("No xib file or wrong structure")
        }

        return object
    }
}
