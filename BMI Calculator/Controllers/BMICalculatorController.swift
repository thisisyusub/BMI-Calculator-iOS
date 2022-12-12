//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class BMICalculatorController: UIViewController {
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func onHeightChanged(_ sender: UISlider) {
        let value = String(format: "%.2f", sender.value)
        heightLabel.text = "\(value)m"
    }
    
    @IBAction func onWeightChanged(_ sender: UISlider) {
        let value = String(format: "%.2f", sender.value)
        weightLabel.text = "\(value)kg"
    }
    
    
    @IBAction func onCalculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let resultController = segue.destination as! ResultViewController
            resultController.bmiValue = calculatorBrain.getBMIValue()
            resultController.advice = calculatorBrain.getAdvice()
            resultController.color = calculatorBrain.getColor()
        }
    }
}

