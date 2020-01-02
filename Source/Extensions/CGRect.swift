//
//  CGRect.swift
//  MD
//
//  Created by Михаил Андреичев on 29/08/2019.
//  Copyright © 2019 Itis. All rights reserved.
//

import UIKit

public extension CGRect {
    /// Инициализирует CGRect с параметрами x и y, равными нулю
    ///
    /// - Parameters:
    ///   - width: ширина
    ///   - height: высота
    init(width: CGFloat, height: CGFloat) {
        self.init(origin: .zero, size: CGSize(width: width, height: height))
    }

    /// Инициализирует CGRect с параметрами x и y, равными нулю и указанным размером
    ///
    /// - Parameters:
    ///   - size: размер
    init(size: CGSize) {
        self.init(origin: .zero, size: size)
    }

    /// Возвращает новый CGRect с заданной высотой
    func with(height: CGFloat) -> CGRect {
        return CGRect(x: origin.x, y: origin.y, width: width, height: height)
    }

    /// Возвращает новый CGRect с заданной шириной
    func with(width: CGFloat) -> CGRect {
        return CGRect(x: origin.x, y: origin.y, width: width, height: height)
    }

    /// Инициализирует CGRect со значениями x: 0, y: 0, width: 1, height: 1
    ///
    static var unit: CGRect { return .init(x: 0, y: 0, width: 1, height: 1) }

    /// Возвращает CGRect с кооднинатами в центре экрана и нулевым размером
    ///
    static var centerOfScreen: CGRect {
        let screenSize = UIScreen.main.bounds
        let originCenter = CGPoint(x: screenSize.width / 2, y: screenSize.height / 2)
        return CGRect(origin: originCenter, size: .zero)
    }
}
