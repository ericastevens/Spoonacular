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
    
    func getRecpiesByCalories(callback: @escaping ([String:Any]?) -> Void) {
        let targetCalories = 2000
        
        enum TimeFrame {
            case day
            case week
        }
        
        let endpointString = "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/mealplans/generate?targetCalories=\(targetCalories)&timeFrame=\(TimeFrame.day)"
        
        guard let endpoint = URL(string: endpointString) else { return }
        
        var request: URLRequest = URLRequest(url: endpoint)
        request.httpMethod = "GET"
        request.addValue("WXZdvOHUNtmshyUPETKmT7rhjktnp1Wsb2sjsnWKkkateMoCtL", forHTTPHeaderField: "X-Mashape-Key")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        let session = URLSession(configuration: .default)
        
        session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            if error != nil {
                print("Error: \(error?.localizedDescription)")
            }
            
            if response != nil {
                let httpResponse = (response! as! HTTPURLResponse)
                print("Response Status Code: \(httpResponse.statusCode)")
            }
            
            if data != nil {
                print(data!)
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any] {
                        callback(json)
                    }
                    
                }
                catch {
                    print("Error converting json: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}
