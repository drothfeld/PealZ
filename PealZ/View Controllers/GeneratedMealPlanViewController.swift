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
    var dietFocus: String!
    var dietName: String!
    var calorieGoal: String!
    var isVegetarian: Bool!
    var isVegan: Bool!
    var isGlutenFree: Bool!
    var isDairyFree: Bool!
    var breakfastFoodsRawString: String!
    var lunchFoodsRawString: String!
    var dinnerFoodsRawString: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // The Reset button is pressed
    @IBAction func resetButtonPressed(_ sender: Any) {
    }
}
