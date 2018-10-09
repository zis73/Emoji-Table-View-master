//
//  Emoji.swift
//  Table View
//
//  Created by Denis Bystruev on 09.10.2018.
//  Copyright © 2018 Denis Bystruev. All rights reserved.
//

class Emoji {
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    init(symbol: String, name: String, description: String, usage: String) {
        self.symbol = symbol
        self.name = name
        self.description = description
        self.usage = usage
    }
}
