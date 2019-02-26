//
//  FoodPreferencesViewController.swift
//  PealZ
//
//  Created by Dylan Rothfeld on 2/25/19.
//  Copyright © 2019 Dylan Rothfeld. All rights reserved.
//

import UIKit

class FoodPreferencesViewController: UIViewController {
    
    // UI Outlets
    @IBOutlet weak var BreakfastFoodsTextView: UITextView!
    @IBOutlet weak var LunchFoodsTextView: UITextView!
    @IBOutlet weak var DinnerFoodsTextView: UITextView!
    
    // Controller Values
    var dietFocus: String = ""
    var dietName: String = ""
    var calorieGoal: String = ""
    var isVegetarian: Bool = false
    var isVegan: Bool = false
    var isGlutenFree: Bool = false
    var isDairyFree: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Prepare segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! GeneratedMealPlanViewController
        controller.dietFocus = dietFocus
        controller.dietName = dietName
        controller.calorieGoal = calorieGoal
        controller.isVegetarian = isVegetarian
        controller.isVegan = isVegan
        controller.isGlutenFree = isGlutenFree
        controller.isDairyFree = isDairyFree
        controller.breakfastFoodsRawString = BreakfastFoodsTextView.text
        controller.lunchFoodsRawString = LunchFoodsTextView.text
        controller.dinnerFoodsRawString = DinnerFoodsTextView.text
    }
    
    // The Next button is pressed
    @IBAction func nextButtonPressed(_ sender: Any) {
    }
    
    // The Reset button is pressed
    @IBAction func resetButtonPressed(_ sender: Any) {
    }
}
