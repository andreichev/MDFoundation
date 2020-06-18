//
//  ExtensionUIView.swift
//  MD
//
//  Copyright © 2019 Itis. All rights reserved.
//

import UIKit

public extension UIView {
 
    /// Данный метод добавляет возможность трясти вьюху.
    ///
    func shake(completion: (() -> Void)? = nil) {
        shake(times: 3, duration: 0.05, amplitude: 5, completion: completion)
    }

    func shake(times: Float, duration: TimeInterval, amplitude: CGFloat, completion: (() -> Void)?) {
        CATransaction.begin()

        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = duration
        animation.repeatCount = times
        animation.autoreverses = true
        animation.fromValue = CGPoint(x: center.x - amplitude, y: center.y)
        animation.toValue = CGPoint(x: center.x + amplitude, y: center.y)
        layer.add(animation, forKey: "position")

        CATransaction.setCompletionBlock(completion)
        CATransaction.commit()
    }

    func makeEdgesEqualToSuperview(inset: UIEdgeInsets = .zero) {
        guard let superview = superview else {
            fatalError("View must have superview")
        }
        topAnchor.constraint(
            equalTo: superview.topAnchor, constant: inset.top
        ).isActive = true
        bottomAnchor.constraint(
            equalTo: superview.bottomAnchor, constant: inset.bottom
        ).isActive = true
        leadingAnchor.constraint(
            equalTo: superview.leadingAnchor, constant: inset.left
        ).isActive = true
        trailingAnchor.constraint(
            equalTo: superview.trailingAnchor, constant: inset.right
        ).isActive = true
    }

    /// Border color of view; also inspectable from Storyboard.
    @IBInspectable var borderColor: UIColor? {
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
        set {
            guard let color = newValue else {
                layer.borderColor = nil
                return
            }
            layer.borderColor = color.cgColor
        }
    }

    /// Border width of view; also inspectable from Storyboard.
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    /// Corner radius of view; also inspectable from Storyboard.
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.masksToBounds = true
            layer.cornerRadius = newValue
        }
    }

    /// Height of view.
    var height: CGFloat {
        get {
            return frame.size.height
        }
        set {
            frame.size.height = newValue
        }
    }

    /// Width of view.
    var width: CGFloat {
        get {
            return frame.size.width
        }
        set {
            frame.size.width = newValue
        }
    }

    /// Size of view.
    var size: CGSize {
        get {
            return frame.size
        }
        set {
            width = newValue.width
            height = newValue.height
        }
    }

    /// x origin of view.
    var x: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            frame.origin.x = newValue
        }
    }

    /// y origin of view.
    var y: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            frame.origin.y = newValue
        }
    }

    /// Set some or all corners radiuses of view.
    ///
    /// - Parameters:
    ///   - corners: array of corners to change (example: [.bottomLeft, .topRight]).
    ///   - radius: radius for selected corners.
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )

        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }

    /// Add shadow to view.
    ///
    /// - Parameters:
    ///   - color: shadow color (default is #137992).
    ///   - radius: shadow radius (default is 3).
    ///   - offset: shadow offset (default is .zero).
    ///   - opacity: shadow opacity (default is 0.5).
    func addShadow(
        ofColor color: UIColor = UIColor(red: 0.07, green: 0.47, blue: 0.57, alpha: 1.0), 
        radius: CGFloat = 3,
        offset: CGSize = .zero, 
        opacity: Float = 0.5
    ) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
    }

    /// Fade in view.
    ///
    /// - Parameters:
    ///   - duration: animation duration in seconds (default is 1 second).
    ///   - completion: optional completion handler to run with animation finishes (default is nil)
    func fadeIn(duration: TimeInterval = 0.3, completion: ((Bool) -> Void)? = nil) {
        if isHidden {
            isHidden = false
        }
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1
        }, completion: completion)
    }

    /// Fade out view.
    ///
    /// - Parameters:
    ///   - duration: animation duration in seconds (default is 1 second).
    ///   - completion: optional completion handler to run with animation finishes (default is nil)
    func fadeOut(duration: TimeInterval = 0.3, completion: ((Bool) -> Void)? = nil) {
        if isHidden {
            isHidden = false
        }
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0
        }, completion: completion)
    }

    /// Remove all subviews in view.
    func removeSubviews() {
        subviews.forEach { $0.removeFromSuperview() }
    }

    var globalFrame: CGRect {
        let rootView = UIApplication.shared.keyWindow?.rootViewController?.view
        return convert(frame, to: rootView)
    }
}
