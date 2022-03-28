//
//  Order.swift
//  CupcakeCorner
//
//  Created by Garret Poole on 3/28/22.
//

import SwiftUI

class Order: ObservableObject {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Funfetti"]
    //using index is bad idea for mutable arrays as the array can change overtime
    @Published var type = 0
    @Published var quantity = 3
    
    @Published var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false{
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    @Published var extraFrosting = false
    @Published var addSprinkles = false
}
