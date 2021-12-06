//
//  String+Extensions.swift
//  Week9
//
//  Created by Mehmet Salih ÇELİK on 6.12.2021.
//
import Foundation

extension String {
    func localized(_ lang: String) -> String {
        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}
