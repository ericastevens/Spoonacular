//
//  CalorieBasedRecipe.swift
//  Spoonacular
//
//  Created by Erica Y Stevens on 12/14/16.
//  Copyright © 2016 Erica Stevens. All rights reserved.
//

import Foundation
//MealPlanNutrients model accompanies this model
class CalorieBasedRecipe {
    var id: Int
    var title: String
    var readyInMinutes: Int
    
    init?(from dict: [String:Any]) {
        guard let id = dict["id"] as? Int,
            let title = dict["title"] as? String,
            let readyInMiuntes = dict["readyInMinutes"] as? Int  else { return nil }
        self.id = id
        self.title = title
        self.readyInMinutes = readyInMiuntes
    }
    
    static func parseRecipes(from arr: [[String:Any]]) -> [CalorieBasedRecipe] {
        var recipes = [CalorieBasedRecipe]()
        
        arr.forEach { (jsonDict) in
            if let recipe = CalorieBasedRecipe(from: jsonDict) {
                recipes.append(recipe)
            }
        }
        print(recipes)
        return recipes
    }
    
}
