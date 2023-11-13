//
//  StringFile.swift
//  TestApp
//
//  Created by עלי חלאחלה on 02/11/2023.
//

import Foundation

func localizedString(forKey key: String) -> String {
    var result = Bundle.main.localizedString(forKey: key, value: nil, table: nil)

    if result == key {
        result = Bundle.main.localizedString(forKey: key, value: nil, table: "Strings")
    }

    return result
}
