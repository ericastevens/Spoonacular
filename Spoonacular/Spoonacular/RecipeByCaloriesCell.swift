//
//  RecipeByCaloriesCell.swift
//  Spoonacular
//
//  Created by Erica Y Stevens on 12/14/16.
//  Copyright © 2016 Erica Stevens. All rights reserved.
//

import UIKit
import FoldingCell

class RecipeByCaloriesCell: FoldingCell {

    
    
    override func animationDuration(_ itemIndex:NSInteger, type:AnimationType)-> TimeInterval {
        
        // durations count equal it itemCount
        let durations = [0.33, 0.26, 0.26] // timing animation for each view
        return durations[itemIndex]
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
