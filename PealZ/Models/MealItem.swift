//
//  MealItem.swift
//  PealZ
//
//  Created by Dylan Rothfeld on 2/26/19.
//  Copyright © 2019 Dylan Rothfeld. All rights reserved.
//

import UIKit

class MealItem {
    // Fields
    var name: String
    var quantity: Int = 1
    var totalCarbs: Int
    var totalFat: Int
    var totalCalories: Int
    var totalProtein: Int
    var totalFiber: Int
    var totalSugar: Int
    
    // Constructor
    init(name: String, quantity: Int?, totalCarbs: Int, totalFat: Int, totalCalories: Int, totalProtein: Int, totalFiber: Int, totalSugar: Int) {
        self.name = name
        self.quantity = quantity ?? 1
        self.totalCarbs = totalCarbs
        self.totalFat = totalFat
        self.totalCalories = totalCalories
        self.totalProtein = totalProtein
        self.totalFiber = totalFiber
        self.totalSugar = totalSugar
    }
    
    // Increases the quantity of the food item
    func incrementQuantity() {
        self.quantity += 1
        self.totalCarbs *= 2
        self.totalFat *= 2
        self.totalCalories *= 2
        self.totalProtein *= 2
        self.totalFiber *= 2
        self.totalSugar *= 2
    }
}
