//
//  Grid.swift
//  MDFoundation
//
//  Created by Anton on 18/01/2019.
//

import UIKit

public extension CGSize {
    /// Инициализирует струтуру с идентичными размерами по высоте и ширине, равными входящему параметру
    ///
    /// - Parameter size: размер с которым нужно инициализировать структуру
    init(_ size: CGFloat) {
        self.init(width: size, height: size)
    }

    /// Умножает все элементы структуры на множитель
    ///
    /// - Parameters:
    ///   - lhs: исходная структура CGSize
    ///   - rhs: множитель
    /// - Returns: результат умножения всех элементов на множитель
    func multipliedBy(_ rhs: CGFloat) -> CGSize {
        return CGSize(width: width * rhs, height: height * rhs)
    }
}

extension UIOffset {
    /// Инициализирует структуру с отсутапми равными ширине и высоте входящего параметра
    ///
    /// - Parameter size: размер с которым нужно инициализировать структуру
    init(_ size: CGSize) {
        self.init(horizontal: size.width, vertical: size.height)
    }
}

public extension UIEdgeInsets {
    /// Инициализирует структуру с попарно одинаковыми отсутапми, сверху и снизу равными высоте, слева и справа — ширине
    ///
    /// - Parameter size: высота и ширина отступов
    init(_ size: CGSize) {
        self.init(top: size.height, left: size.width, bottom: size.height, right: size.width)
    }

    /// Умножает все элементы структуры на множитель
    ///
    /// - Parameters:
    ///   - by: множитель
    /// - Returns: результат умножения всех элементов на множитель
    func multiplied(by: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: top * by, left: left * by, bottom: bottom * by, right: right * by)
    }

    /// Инициализирует структуру с заданными вертикальными и горизонтальными отступами
    init(vertical: CGFloat = 0, horizontal: CGFloat = 0) {
        self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }

    /// Инициализирует структуру с равными по всем сторонам отступами
    init(uniform: CGFloat) {
        self.init(top: uniform, left: uniform, bottom: uniform, right: uniform)
    }

    /// Возвращает новую структуру с заданным отступом сверху
    func with(top: CGFloat) -> UIEdgeInsets {
        var inset = self
        inset.top = top
        return inset
    }

    /// Возвращает новую структуру с заданным отступом слева
    func with(left: CGFloat) -> UIEdgeInsets {
        var inset = self
        inset.left = left
        return inset
    }

    /// Возвращает новую структуру с заданным отступом снизу
    func with(bottom: CGFloat) -> UIEdgeInsets {
        var inset = self
        inset.bottom = bottom
        return inset
    }

    /// Возвращает новую структуру с заданным отступом справа
    func with(right: CGFloat) -> UIEdgeInsets {
        var inset = self
        inset.right = right
        return inset
    }
}
