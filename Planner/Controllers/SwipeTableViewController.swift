//
//  SwipeTableViewController.swift
//  Planner
//
//  Created by Chris Withers on 8/26/20.
//  Copyright © 2020 Chris Withers. All rights reserved.
//

import UIKit
import SwipeCellKit

class SwipeTableViewController: UITableViewController, SwipeTableViewCellDelegate {
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
         guard orientation == .right else { return nil }
               
               let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
                   
                   self.updateModel(at: indexPath)
                   
               }
               
               // customize the action appearance
               deleteAction.image = UIImage(named: "delete-icon")
               
               return [deleteAction]
    }
    
    func updateModel(at indexPath: IndexPath){
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "Goal", for: indexPath) as! SwipeTableViewCell
        
        cell.delegate = self
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80.0
    }

    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        
        return options
    }
    
}
