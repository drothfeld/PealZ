//
//  DietFocus.swift
//  PealZ
//
//  Created by Dylan Rothfeld on 2/26/19.
//  Copyright © 2019 Dylan Rothfeld. All rights reserved.
//

import UIKit

class DietFocus {
    // Fields
    var name: String
    var carbLimit: Int
    var fatLimit: Int
    var proteinLimit: Int
    var fiberLimit: Int
    var sugarLimit: Int
    
    // Constructor
    init(name: String, carbLimit: Int, fatLimit: Int, proteinLimit: Int, fiberLimit: Int, sugarLimit: Int) {
        self.name = name
        self.carbLimit = carbLimit
        self.fatLimit = fatLimit
        self.proteinLimit = proteinLimit
        self.fiberLimit = fiberLimit
        self.sugarLimit = sugarLimit
    }
    
    // Check if a three course meal plan [breakfast, lunch, dinner]
    // meets this diet focus
    func isValidMealPlan(breakfast: [MealItem], lunch: [MealItem], dinner: [MealItem], calorieLimit: Int) -> Bool {
        let mealPlan = [breakfast, lunch, dinner]
        var carbCount = 0
        var fatCount = 0
        var proteinCount = 0
        var fiberCount = 0
        var sugarCount = 0
        var calorieCount = 0
        
        // Aggregate nutritional values for all meal items
        for meal in mealPlan {
            for mealItem in meal {
                carbCount += mealItem.totalCarbs
                fatCount += mealItem.totalFat
                proteinCount += mealItem.totalProtein
                fiberCount += mealItem.totalFiber
                sugarCount += mealItem.totalSugar
                calorieCount += mealItem.totalCalories
            }
        }
        
        // Check if the aggregated nutrional values
        // violate any threshold values
        if (calorieCount > calorieLimit ||
            carbCount > self.carbLimit ||
            fatCount > self.fatLimit ||
            proteinCount > self.proteinLimit ||
            fiberCount > self.fiberLimit ||
            sugarCount > self.sugarLimit ||
            calorieCount > calorieLimit) {
            return false
        }
        
        return true
    }
}
