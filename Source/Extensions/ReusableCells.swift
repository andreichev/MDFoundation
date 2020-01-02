//
//  ReusableCells.swift
//  MD
//
//  Created by Михаил Андреичев on 22/09/2019.
//  Copyright © 2019 Itis. All rights reserved.
//

import UIKit

extension UITableViewCell {
    public static var identifier: String {
        return Utils.getClassName(self)
    }

    public static var nib: UINib {
        UINib(nibName: identifier, bundle: Bundle(for: self))
    }
}

extension UICollectionViewCell {
    public static var identifier: String {
        return Utils.getClassName(self)
    }

    public static var nib: UINib {
        UINib(nibName: identifier, bundle: Bundle(for: self))
    }
}
