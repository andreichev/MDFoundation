//
//  StringValidator.swift
//  MDFoundation
//
//  Created by Михаил Андреичев on 09.01.2020.
//

/// Пример:
/// enum AuthValidationType: ValidationType {
///    case phone
///    case name
///
///    var regularExpression: String {
///        switch self {
///        case .phone:
///            return "^\\(\\d{3}\\)\\s\\d{3}-\\d{2}-\\d{2}$"
///        case .name:
///            return "^[А-Яа-я]{2,20}$"
///        }
///    }
/// }

import Foundation

public protocol ValidationType {
    var regularExpression: String { get }
}

/// Пример использования:
/// if StringValidator.validate(
///    string: name,
///    withType: AuthValidationType.name
/// ) == false { ... }
public final class StringValidator {
    /// Validate string with given validation type
    ///
    /// - Parameters:
    ///   - string: string to validate
    ///   - validationType: validation type
    /// - Returns: string is valid with given type
    public static func validate(string: String?, withType validationType: ValidationType) -> Bool {
        guard let string = string else { return false }
        let regularExpressionTest = NSPredicate(format: "SELF MATCHES %@", validationType.regularExpression)
        return regularExpressionTest.evaluate(with: string)
    }
}
