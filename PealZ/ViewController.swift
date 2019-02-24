//
//  ViewController.swift
//  PealZ
//
//  Created by Dylan Rothfeld on 2/22/19.
//  Copyright © 2019 Dylan Rothfeld. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // UI Outlets
    @IBOutlet weak var DietFocusPicker: UIPickerView!
    
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
    
    // Perform any additional UI setup
    func interfaceSetup() {
        self.DietFocusPicker.delegate = self
        self.DietFocusPicker.dataSource = self
        dietFocusPickerData = ["Normal Balance", "Heavy Protein", "Extra Fiber", "Low Fat", "Carbo-Loading"]
    }
}

