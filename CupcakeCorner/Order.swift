//
//  Order.swift
//  CupcakeCorner
//
//  Created by Garret Poole on 3/28/22.
//

import SwiftUI

class Order: ObservableObject, Codable{
    enum CodingKeys: CodingKey{
        case order
    }
    @Published var order = OrderStruct()
    //allows code to compile with override below
    init() {}
    
    //bypasses the @Published property wrapper to make it Codable compliant
    //saves(encodes) the object to json
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(order, forKey: .order)
    }
    
    required init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        order = try container.decode(OrderStruct.self, forKey: .order)
    }
}


struct OrderStruct: Codable {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Funfetti"]
    //using index is bad idea for mutable arrays as the array can change overtime
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false{
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasValidAddress: Bool{
        let trimmedname = name.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedstreetAddress = streetAddress.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedcity = city.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedzip = zip.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmedname.isEmpty || trimmedstreetAddress.isEmpty || trimmedcity.isEmpty || trimmedzip.isEmpty{
            return false
        }
        return true
    }
    
    var cost: Double{
        //$2 per cake
        var cost = Double(quantity) * 2
        //complicated cost more
        cost += (Double(type) / 2)
        //$1 for extra frosting
        if extraFrosting{
            cost += Double(quantity)
        }
        //$.50 for adding sprinkles
        if addSprinkles{
            cost += Double(quantity) / 2
        }
        return cost
    }
}
