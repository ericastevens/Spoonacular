//
//  APIRequestManager.swift
//  Spoonacular
//
//  Created by Erica Y Stevens on 12/13/16.
//  Copyright © 2016 Erica Stevens. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIRequestManager {
    static let manager = APIRequestManager()
    private init() {}
    
    func getRecpiesByCalories() {
        let targetCalories = 2000
        
        enum TimeFrame {
            case day
            case week
        }
        
        let url = "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/mealplans/generate?targetCalories=\(targetCalories)&timeFrame=\(TimeFrame.day)"
        
        Alamofire.request(url).responseJSON { (dataResponse) in
            if let jsonData = dataResponse.data {
                let swiftyJSON = JSON(data: jsonData)
                let recipe = swiftyJSON["meals"]
                print("SWIFT JSON WORKED: \(recipe)")
                
            }
        }
    }
}
