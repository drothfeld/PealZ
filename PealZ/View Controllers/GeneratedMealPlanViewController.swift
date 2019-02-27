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
//        var testMealItem = getMealItemNutritionData(item: "avocado toast")
//        testMealItem.incrementQuantity()
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
        var capturedMealItem: MealItem? = nil
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
                print(responseJSON.description)
                var capturedCarbs = 0
                var capturedFat = 0
                var capturedCalories = 0
                var capturedProtein = 0
                var capturedFiber = 0
                var capturedSugar = 0
                
                var currentSubstring: String = ""
                
                var foundCarbData = 0
                var foundFatData = 0
                var foundCaloriesData = 0
                var foundProteinData = 0
                var foundFiberData = 0
                var foundSugarData = 0
                
                // Parsing returned JSON to create MealItem object
                for (_, char) in responseJSON.description.enumerated() {
                    // Found carb field
                    if (foundCarbData == 0 && currentSubstring.trimmingCharacters(in: .whitespaces) == "\"nf_total_carbohydrate\"") { foundCarbData = 1 }
                    // Found fat field
                    if (foundFatData == 0 && currentSubstring.trimmingCharacters(in: .whitespaces) == "\"nf_total_fat\"") { foundFatData = 1 }
                    // Found calories field
                    if (foundCaloriesData == 0 && currentSubstring.trimmingCharacters(in: .whitespaces) == "\"nf_calories\"") { foundCaloriesData = 1 }
                    // Found protein field
                    if (foundProteinData == 0 && currentSubstring.trimmingCharacters(in: .whitespaces) == "\"nf_protein\"") { foundProteinData = 1 }
                    // Found fiber field
                    if (foundFiberData == 0 && currentSubstring.trimmingCharacters(in: .whitespaces) == "\"nf_dietary_fiber\"") { foundFiberData = 1 }
                    // Found sugar field
                    if (foundSugarData == 0 && currentSubstring.trimmingCharacters(in: .whitespaces) == "\"nf_sugars\"") { foundSugarData = 1 }
                    
                    // Reset substring
                    if (char == " ") {
                        // Get carb field data
                        if (foundCarbData < 3 && foundCarbData > 0) { foundCarbData += 1 } else if (foundCarbData == 3) { foundCarbData = 4
                            let characters = Array(currentSubstring.dropLast())
                            var decodedString = ""
                            for (index, value) in characters.enumerated() { if (index > 1 && index < characters.count - 2) { decodedString += String(value) } }
                            capturedCarbs = Int(Float(decodedString)!)
                        }
                        // Get fat field data
                        if (foundFatData < 3 && foundFatData > 0) { foundFatData += 1 } else if (foundFatData == 3) { foundFatData = 4
                            let characters = Array(currentSubstring.dropLast())
                            var decodedString = ""
                            for (index, value) in characters.enumerated() { if (index > 1 && index < characters.count - 2) { decodedString += String(value) } }
                            capturedFat = Int(Float(decodedString)!)
                        }
                        // Get calories field data
                        if (foundCaloriesData < 3 && foundCaloriesData > 0) { foundCaloriesData += 1 } else if (foundCaloriesData == 3) { foundCaloriesData = 4
                            let characters = Array(currentSubstring.dropLast())
                            var decodedString = ""
                            for (index, value) in characters.enumerated() { if (index > 1 && index < characters.count - 2) { decodedString += String(value) } }
                            capturedCalories = Int(Float(decodedString)!)
                        }
                        // Get protein field data
                        if (foundProteinData < 3 && foundProteinData > 0) { foundProteinData += 1 } else if (foundProteinData == 3) { foundProteinData = 4
                            let characters = Array(currentSubstring.dropLast())
                            var decodedString = ""
                            for (index, value) in characters.enumerated() { if (index > 1 && index < characters.count - 2) { decodedString += String(value) } }
                            capturedProtein = Int(Float(decodedString)!)
                        }
                        // Get fiber field data
                        if (foundFiberData < 3 && foundFiberData > 0) { foundFiberData += 1 } else if (foundFiberData == 3) { foundFiberData = 4
                            let characters = Array(currentSubstring.dropLast())
                            var decodedString = ""
                            for (index, value) in characters.enumerated() { if (index > 1 && index < characters.count - 2) { decodedString += String(value) } }
                            capturedFiber = Int(Float(decodedString)!)
                        }
                        // Get sugar field data
                        if (foundSugarData < 3 && foundSugarData > 0) { foundSugarData += 1 } else if (foundSugarData == 3) { foundSugarData = 4
                            let characters = Array(currentSubstring.dropLast())
                            var decodedString = ""
                            for (index, value) in characters.enumerated() { if (index > 1 && index < characters.count - 2) { decodedString += String(value) } }
                            capturedSugar = Int(Float(decodedString)!)
                        }
                        
                        currentSubstring = ""
                    }
                    
                    // Add on to the current substring
                    currentSubstring += String(char)
                }
                
                // Creating local MealItem object based on captured data from API call
                capturedMealItem = MealItem(name: item, quantity: 1, totalCarbs: capturedCarbs, totalFat: capturedFat, totalCalories: capturedCalories, totalProtein: capturedProtein, totalFiber: capturedFiber, totalSugar: capturedSugar)
            }
        }
        task.resume()
        
        return capturedMealItem ?? meal_item_error
        
    }
    
    // The Reset button is pressed
    @IBAction func resetButtonPressed(_ sender: Any) {
    }
}
