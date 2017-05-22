//
//  NutrimentItem.swift
//  OpenFoodFacts
//
//  Created by Andrés Pizá Bückmann on 15/05/2017.
//  Copyright © 2017 Andrés Pizá Bückmann. All rights reserved.
//

import Foundation
import ObjectMapper

struct NutrimentItem {
    var total: String?
    var per100g: Double?
    var perServing: String?
    var unit: String?
    var value: String?
    
    // Json keys
    let nameKey: String
    let per100gKey: String
    let servingKey: String
    let unitKey: String
    let valueKey: String
    
    let localized: InfoRowKey
    
    init(nameKey: String, map: Map, localized: InfoRowKey) {
        self.nameKey = nameKey
        self.per100gKey = "\(nameKey)_100g"
        self.servingKey = "\(nameKey)_serving"
        self.unitKey = "\(nameKey)_unit"
        self.valueKey = "\(nameKey)_value"
        
        self.total <- map[nameKey]
        self.per100g <- (map[per100gKey], DoubleTransform())
        self.perServing <- map[servingKey]
        self.unit <- map[unitKey]
        self.value <- map[valueKey]
        
        self.localized = localized
    }
}