//
//  ViewController.swift
//  PealZ
//
//  Created by Dylan Rothfeld on 2/22/19.
//  Copyright © 2019 Dylan Rothfeld. All rights reserved.
//

import UIKit

class DietParametersViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // UI Outlets
    @IBOutlet weak var DietFocusPicker: UIPickerView!
    @IBOutlet weak var EnterNameTextField: UITextField!
    @IBOutlet weak var EnterDailyCalorieGoalTextField: UITextField!
    @IBOutlet weak var VegetarianSwitch: UISwitch!
    @IBOutlet weak var VeganSwitch: UISwitch!
    @IBOutlet weak var GlutenFreeSwitch: UISwitch!
    @IBOutlet weak var DairyFreeSwitch: UISwitch!
    @IBOutlet weak var ResetButton: UIButton!
    @IBOutlet weak var NextButton: UIButton!
    
    // Controller Values
    var dietFocusPickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interfaceSetup()
    }
    
    // Picker column count
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Picker row count
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dietFocusPickerData.count
    }
    
    // Display the picker option labels
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dietFocusPickerData[row]
    }
    
    // Capture the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(dietFocusPickerData[row])
    }
    
    // Format the picker text font
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: dietFocusPickerData[row], attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
    
    // Perform any additional UI setup
    func interfaceSetup() {
        self.DietFocusPicker.delegate = self
        self.DietFocusPicker.dataSource = self
        dietFocusPickerData = ["Normal Balance", "Heavy Protein", "Extra Fiber", "Low Fat", "Carbo-Loading"]
    }

    // The Reset button is presesd
    @IBAction func resetButtonPressed(_ sender: Any) {
        DietFocusPicker.selectRow(0, inComponent: 0, animated: true)
        EnterNameTextField.text = ""
        EnterDailyCalorieGoalTextField.text = ""
        VegetarianSwitch.isOn = false
        VeganSwitch.isOn = false
        GlutenFreeSwitch.isOn = false
        DairyFreeSwitch.isOn = false
    }
    
    // The Next button is pressed
    @IBAction func nextButtonPressed(_ sender: Any) {
    }
    
}

