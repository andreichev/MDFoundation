//
//  UIColor.swift
//  MD
//
//  Created by Михаил Андреичев on 03/09/2019.
//  Copyright © 2019 Itis. All rights reserved.
//

import UIKit

public extension UIColor {
    func image(frame: CGRect) -> UIImage {
        return UIGraphicsImageRenderer(size: frame.size).image { rendererContext in
            setFill()
            rendererContext.fill(CGRect(size: frame.size))
        }
    }

    convenience init(lightThemeColor: UIColor, darkThemeColor: UIColor) {
        if #available(iOS 13, *) {
            self.init { trait in
                trait.userInterfaceStyle == .dark ? darkThemeColor : lightThemeColor
            }
        } else {
            self.init(ciColor: lightThemeColor.ciColor)
        }
    }
}
