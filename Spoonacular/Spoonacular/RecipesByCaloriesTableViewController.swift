//
//  RecipesByCaloriesTableViewController.swift
//  Spoonacular
//
//  Created by Erica Y Stevens on 12/14/16.
//  Copyright © 2016 Erica Stevens. All rights reserved.
//

import UIKit
import FoldingCell

class RecipesByCaloriesTableViewController: UITableViewController {
    
    fileprivate struct C {
        struct CellHeight {
            static let close: CGFloat = 75// equal or greater foregroundView height
            static let open: CGFloat = 200 // equal or greater containerView height
        }
    }
    
    var cellHeights = [CGFloat](repeating: C.CellHeight.close, count: 100)
   // var cellHeights = (0..<itemCount).map { _ in C.CellHeight.close }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
  

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeights[indexPath.row]

    }
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return cellHeights[indexPath.row]
//    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard case let cell as RecipeByCaloriesCell = tableView.cellForRow(at: indexPath) else {
            return
        }
        
        var duration = 0.0
        if cellHeights[indexPath.row] == C.CellHeight.close{ // open cell
            cellHeights[indexPath.row] = C.CellHeight.open
            cell.selectedAnimation(true, animated: true, completion: nil)
            duration = 0.5
        } else {// close cell
            cellHeights[indexPath.row] = C.CellHeight.close
            cell.selectedAnimation(false, animated: true, completion: nil)
            duration = 1.1
        }
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: { _ in
            tableView.beginUpdates()
            tableView.endUpdates()
            }, completion: nil)

    }
    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
//        guard case let cell as RecipeByCaloriesCell = tableView.cellForRow(at: indexPath) else {
//            return
//        }
//        
//        var duration = 0.0
//        if cellHeights[indexPath.row] == C.CellHeight.close{ // open cell
//            cellHeights[indexPath.row] = C.CellHeight.open
//            cell.selectedAnimation(true, animated: true, completion: nil)
//            duration = 0.5
//        } else {// close cell
//            cellHeights[indexPath.row] = C.CellHeight.close
//            cell.selectedAnimation(false, animated: true, completion: nil)
//            duration = 1.1
//        }
//        
//        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: { _ in
//            tableView.beginUpdates()
//            tableView.endUpdates()
//            }, completion: nil)
//    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if case let cell as RecipeByCaloriesCell = cell {
            if cellHeights[indexPath.row] == C.CellHeight.close {
                cell.selectedAnimation(false, animated: false, completion:nil)
            } else {
                cell.selectedAnimation(true, animated: false, completion: nil)
            }
        }
    }
    
//    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
//        
//        if case let cell as RecipeByCaloriesCell = cell {
//            if cellHeights[indexPath.row] == C.CellHeight.close {
//                cell.selectedAnimation(false, animated: false, completion:nil)
//            } else {
//                cell.selectedAnimation(true, animated: false, completion: nil)
//            }
//        }
//    }


    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CalorieBasedRecipeCell", for: indexPath) as! RecipeByCaloriesCell

        // Configure the cell...

        return cell
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
