//
//  ExtensionString.swift
//  MDFoundation
//
//  Created by Михаил Андреичев on 25.11.2019.
//

public extension String {
    var containsOnlyPhoneSymbols: Bool {
        let phoneNumberSet = CharacterSet(charactersIn: "()+*01234567890- ")
        let nonDigitalCharacter = first { CharacterSet(charactersIn: String($0)).isSubset(of: phoneNumberSet.inverted) }
        return nonDigitalCharacter == nil
    }

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
        return trimmedLeft().trimmedRight()
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

    /**
     Strips the specified characters from the beginning of self.
     :returns: Stripped string
     */
    func trimmedLeft(characterSet set: CharacterSet = CharacterSet.whitespacesAndNewlines) -> String {
        if let range = rangeOfCharacter(from: set.inverted) {
            return String(self[range.lowerBound ..< endIndex])
        }

        return ""
    }

    /**
     Strips the specified characters from the end of self.
     :returns: Stripped string
     */
    func trimmedRight(characterSet set: CharacterSet = CharacterSet.whitespacesAndNewlines) -> String {
        if let range = rangeOfCharacter(from: set.inverted, options: NSString.CompareOptions.backwards) {
            return String(self[startIndex ..< range.upperBound])
        }

        return ""
    }
}
