//
//  ExtensionString.swift
//  MDFoundation
//
//  Created by Михаил Андреичев on 25.11.2019.
//

import Foundation

public extension String {
    ///  usage:
    ///      func textField(
    ///      _ textField: UITextField,
    ///      shouldChangeCharactersIn range: NSRange,
    ///      replacementString string: String
    ///      ) -> Bool {
    ///        if textField == phoneTextField {
    ///            guard let text = textField.text else { return false }
    ///            let nsString = NSString(string: text)
    ///            let newText = nsString.replacingCharacters(in: range, with: string)
    ///            textField.text = newText.applyPatternOnNumbers(pattern: "(###) ###-##-##", /replacmentCharacter: "#")
    ///        }
    ///        return false
    ///    }
    func applyPatternOnNumbers(pattern: String, replacmentCharacter: Character) -> String {
        var pureNumber = replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        for index in 0 ..< pattern.count {
            guard index < pureNumber.count else { return pureNumber }
            let stringIndex = pattern.utf16.index(pattern.utf16.startIndex, offsetBy: index)
            let patternCharacter = pattern[stringIndex]
            guard patternCharacter != replacmentCharacter else { continue }
            pureNumber.insert(patternCharacter, at: stringIndex)
        }
        return pureNumber
    }

    static let empty: String = ""
    static let comma: String = ","
    static let space: String = " "

    /**
     Strips whitespaces from both the beginning and the end of self.
     :returns: Stripped string
     */
    func trimmed() -> String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }

    /**
     Parses a string containing a date into an optional NSDate if the string is a well formed.
     The default format is yyyy-MM-dd, but can be overriden.
     :returns: A NSDate parsed from the string or nil if it cannot be parsed as a date.
     */
    func toDate(_ format: String? = "yyyy-MM-dd") -> Date? {
        let text = trimmed().lowercased()
        let dateFmt = DateFormatter()
        dateFmt.timeZone = TimeZone.current
        if let fmt = format {
            dateFmt.dateFormat = fmt
        }
        return dateFmt.date(from: text)
    }

    func onlyDigits() -> String {
        return String(UnicodeScalarView(unicodeScalars.filter { NSCharacterSet.decimalDigits.contains($0) }))
    }
}
