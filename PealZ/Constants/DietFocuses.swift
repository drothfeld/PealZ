//
//  DietFocuses.swift
//  PealZ
//
//  Created by Dylan Rothfeld on 2/26/19.
//  Copyright © 2019 Dylan Rothfeld. All rights reserved.
//

let diet_normal: DietFocus = DietFocus(name: "Normal Balance", carbLimit: 300, fatLimit: 65, proteinLimit: 50, fiberLimit: 25, sugarLimit: 30)

let diet_heavy_protein: DietFocus = DietFocus(name: "Heavy Protein", carbLimit: 300, fatLimit: 65, proteinLimit: 80, fiberLimit: 25, sugarLimit: 30)

let diet_low_protein: DietFocus = DietFocus(name: "Low Protein", carbLimit: 300, fatLimit: 65, proteinLimit: 20, fiberLimit: 25, sugarLimit: 30)

let diet_heavy_fiber: DietFocus = DietFocus(name: "Heavy Fiber", carbLimit: 300, fatLimit: 65, proteinLimit: 50, fiberLimit: 40, sugarLimit: 30)

let diet_low_fiber: DietFocus = DietFocus(name: "Low Fiber", carbLimit: 300, fatLimit: 65, proteinLimit: 50, fiberLimit: 10, sugarLimit: 30)

let diet_heavy_fat: DietFocus = DietFocus(name: "Heavy Fat", carbLimit: 300, fatLimit: 100, proteinLimit: 50, fiberLimit: 25, sugarLimit: 30)

let diet_low_fat: DietFocus = DietFocus(name: "Low Fat", carbLimit: 300, fatLimit: 30, proteinLimit: 50, fiberLimit: 25, sugarLimit: 30)

let diet_heavy_sugar: DietFocus = DietFocus(name: "Heavy Sugar", carbLimit: 300, fatLimit: 65, proteinLimit: 50, fiberLimit: 25, sugarLimit: 50)

let diet_low_sugar: DietFocus = DietFocus(name: "Low Sugar", carbLimit: 300, fatLimit: 65, proteinLimit: 50, fiberLimit: 25, sugarLimit: 10)

let diet_heavy_carbs: DietFocus = DietFocus(name: "Heavy Carbs", carbLimit: 400, fatLimit: 65, proteinLimit: 50, fiberLimit: 25, sugarLimit: 30)

let diet_low_carbs: DietFocus = DietFocus(name: "Low Carbs", carbLimit: 200, fatLimit: 65, proteinLimit: 50, fiberLimit: 25, sugarLimit: 30)


let dietFocusGroups: [DietFocus] = [diet_normal, diet_heavy_protein, diet_low_protein, diet_heavy_fiber, diet_low_fiber, diet_heavy_fat, diet_low_fat, diet_heavy_sugar, diet_low_sugar, diet_heavy_carbs, diet_low_carbs]
