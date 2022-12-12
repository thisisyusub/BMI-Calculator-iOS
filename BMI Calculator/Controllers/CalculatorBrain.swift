//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by thisisyusub on 12.12.22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit


struct CalculatorBrain {
    var bmi: BMI?
    
    func getBMIValue() -> String {
        return String(format: "%.1f", bmi?.value ?? 0)
    }
    
    
    mutating func calculateBMI(height: Float, weight: Float)  {
        let bmiValue = weight / pow(height, 2)
        
        
        let advice: String
        let color: UIColor
        
        if bmiValue < 18.5 {
            advice = "Underweight"
            color = .systemIndigo
        } else if bmiValue < 24.9 {
            advice = "Normal"
            color = .systemTeal
        } else {
            advice = "Overweight"
            color = .orange
        }
        
        bmi = BMI(value: bmiValue, advice: advice, color: color)
    }
    
    func getAdvice() -> String {
        bmi?.advice ?? "No Advice"
    }
    
    func getColor() -> UIColor {
        bmi!.color
    }
}
