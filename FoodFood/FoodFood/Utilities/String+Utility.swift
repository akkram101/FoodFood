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

extension String {
    
    var isBlank: Bool{
        return self.allSatisfy( {$0.isWhitespace })
    }
    
//    static var 
}
