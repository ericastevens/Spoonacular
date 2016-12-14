//
//  MealPlanNutrients.swift
//  Spoonacular
//
//  Created by Erica Y Stevens on 12/14/16.
//  Copyright © 2016 Erica Stevens. All rights reserved.
//

import Foundation
//CaloriesBasedRecipes accompanies this Model
class MealPlanNutrients {
    var calories: Int
    var protein: Int
    var fat: Int
    var carbohydrates: Int
    
    init?(from dict:[String:Any]) {
        guard let calories = dict["calories"] as? Int,
            let protein = dict["protein"] as? Int,
            let fat = dict["fat"] as? Int,
            let carbohydrates = dict["carbohydrates"] as? Int else { return nil }
        self.calories = calories
        self.carbohydrates = carbohydrates
        self.fat = fat
        self.protein = protein
    }
}
