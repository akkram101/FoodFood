//
//  String+Utility.swift
//  FoodFood
//
//  Created by Akkram Bederi on 6/29/23.
//

import Foundation

func KStringIsEmpty(_ str: String?) -> Bool {
    return str == nil || str!.isBlank
}

func attributedTextFromHTML(htmlString: String) -> NSAttributedString? {
    guard let data = htmlString.data(using: .utf8) else {
        return nil
    }

    if let attributedText = try? NSAttributedString(
        data: data,
        options: [.documentType: NSAttributedString.DocumentType.html],
        documentAttributes: nil
    ) {
        return attributedText
    }

    return nil
}

extension String {
    
    var isBlank: Bool{
        return self.allSatisfy( {$0.isWhitespace })
    }
    
//    static var 
}
