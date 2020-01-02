//
//  Utils.swift
//  MDFoundation
//
//  Created by Михаил Андреичев on 09.12.2019.
//

public final class Utils {
    public static func getClassName(_ c: AnyClass) -> String {
        let fullName = String(describing: c)
        guard let className = fullName.split(separator: ".").last
        else { return fullName }
        return String(className)
    }
}
