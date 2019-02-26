//
//  GeneratedMealPlanViewController.swift
//  PealZ
//
//  Created by Dylan Rothfeld on 2/25/19.
//  Copyright © 2019 Dylan Rothfeld. All rights reserved.
//

import UIKit
import Foundation

class GeneratedMealPlanViewController: UIViewController {
    
    // UI Outlets
    @IBOutlet weak var BreakfastCalorieLabel: UILabel!
    @IBOutlet weak var LunchCalorieLabel: UILabel!
    @IBOutlet weak var DinnerCalorieLabel: UILabel!
    @IBOutlet weak var GeneratedBreakfastTextView: UITextView!
    @IBOutlet weak var GeneratedLunchTextView: UITextView!
    @IBOutlet weak var GeneratedDinnerTextView: UITextView!
    
    // Controller Values
    var dietFocus: DietFocus!
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
    
        // TESTING NUTRITIONIX API CALL METHOD
        let _ = getMealItemNutritionData(item: "avacado toast")
    }
    
    // Parse the breakfast/lunch/dinner food preferences raw data
    func parseFoodPreferenceData() {
        breakfastFoodsList = breakfastFoodsRawString.components(separatedBy: ",")
        lunchFoodsList = lunchFoodsRawString.components(separatedBy: ",")
        dinnerFoodsList = dinnerFoodsRawString.components(separatedBy: ",")
    }
    
    // Makes an API call to Nutritionix to gather
    // all nutritional data for meal item
    func getMealItemNutritionData(item: String) -> MealItem {
        // API URL
        let url = URL(string: "https://trackapi.nutritionix.com/v2/natural/nutrients")
        let unwrappedURL = url!
        
        // API JSON BODY
        let json: [String: Any] = ["query": item,
                                   "timezone": "US/Eastern"]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        // API request setup
        var request = URLRequest(url: unwrappedURL)
        request.httpBody = jsonData
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(nutritionixApplicationId, forHTTPHeaderField: "x-app-id")
        request.addValue(nutritionixApplicationKey, forHTTPHeaderField: "x-app-key")
        
        // Make API call
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
            }
        }
        task.resume()
        
        return MealItem(name: "NULL", quantity: 1, totalCarbs: 0, totalFat: 0, totalCalories: 0, totalProtein: 0, totalFiber: 0, totalSugar: 0)
    }
    
    // The Reset button is pressed
    @IBAction func resetButtonPressed(_ sender: Any) {
    }
}
