//
//  Item.swift
//  GroceryList
//
//  Created by Jourdese Palacio on 8/27/25.
//

import Foundation
import SwiftData

@Model
class Item {
    var title: String
    var isCompleted: Bool = false
    
    init(title: String, isCompleted: Bool) {
        self.title = title
        self.isCompleted = isCompleted
    }
}
