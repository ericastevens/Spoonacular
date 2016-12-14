//
//  CalorieBasedRecipe.swift
//  Spoonacular
//
//  Created by Erica Y Stevens on 12/14/16.
//  Copyright © 2016 Erica Stevens. All rights reserved.
//

import Foundation

class CalorieBasedRecipe {
    var id: Int
    var title: String
    var totalCalories: Int
    var protein: Int
    var carbohydrates: Int
    var fat: Int
    
    init(id: Int, title: String, totalCalories: Int, protein: Int, carbohydrates: Int, fat: Int) {
        self.id = id
        self.title = title
        self.totalCalories = totalCalories
        self.protein = protein
        self.carbohydrates = carbohydrates
        self.fat = fat
    }
    
}
