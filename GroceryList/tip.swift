//
//  tip.swift
//  GroceryList
//
//  Created by Jourdese Palacio on 8/28/25.
//

import Foundation
import TipKit

struct ButtonTip: Tip {
    var title: Text = Text("Essential foods")
    var message: Text? = Text("Add some everyday items to your grocery list.")
    var image: Image? = Image(systemName: "info.circle")
}
