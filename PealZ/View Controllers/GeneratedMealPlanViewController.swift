//
//  GeneratedMealPlanViewController.swift
//  PealZ
//
//  Created by Dylan Rothfeld on 2/25/19.
//  Copyright © 2019 Dylan Rothfeld. All rights reserved.
//

import UIKit

class GeneratedMealPlanViewController: UIViewController {
    
    // UI Outlets
    @IBOutlet weak var BreakfastCalorieLabel: UILabel!
    @IBOutlet weak var LunchCalorieLabel: UILabel!
    @IBOutlet weak var DinnerCalorieLabel: UILabel!
    @IBOutlet weak var GeneratedBreakfastTextView: UITextView!
    @IBOutlet weak var GeneratedLunchTextView: UITextView!
    @IBOutlet weak var GeneratedDinnerTextView: UITextView!
    
    // Controller Values
    var dietFocus: String = ""
    var dietName: String = ""
    var calorieGoal: String = ""
    var isVegetarian: Bool = false
    var isVegan: Bool = false
    var isGlutenFree: Bool = false
    var isDairyFree: Bool = false
    
    var breakfastFoodsRawString: String = ""
    var lunchFoodsRawString: String = ""
    var dinnerFoodsRawString: String = ""
    var breakfastFoodsList: [String] = []
    var lunchFoodsList: [String] = []
    var dinnerFoodsList: [String] = []
    
    var finalBreakfast: [MealItem] = []
    var finalLunch: [MealItem] = []
    var finalDinner: [MealItem] = []
    
    var currentCarbs = 0
    var currentFat = 0
    var currentCalories = 0
    var currentProtein = 0
    var currentFiber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parseFoodPreferenceData()
    }
    
    // Parse the breakfast/lunch/dinner food preferences raw data
    func parseFoodPreferenceData() {
        breakfastFoodsList = breakfastFoodsRawString.components(separatedBy: ",")
        lunchFoodsList = lunchFoodsRawString.components(separatedBy: ",")
        dinnerFoodsList = dinnerFoodsRawString.components(separatedBy: ",")
    }
    
    // Makes an API call to Nutritionix to gather
    // all nutritional data for meal item
    func getMealItemNutritionData(mealItem: String) -> MealItem {
        // TODO: Complete API call and create local meal item model
        
        return MealItem(name: "NULL", quantity: 1, totalCarbs: 0, totalFat: 0, totalCalories: 0, totalProtein: 0, totalFiber: 0, totalSugar: 0)
    }
    
    // The Reset button is pressed
    @IBAction func resetButtonPressed(_ sender: Any) {
    }
}
