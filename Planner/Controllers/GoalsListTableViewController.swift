//
//  GoalsListTableViewController.swift
//  Planner
//
//  Created by Chris Withers on 8/24/20.
//  Copyright © 2020 Chris Withers. All rights reserved.
//

import UIKit

class GoalsListTableViewController: UITableViewController {
    
    var currentGoals: [Goal] = [Goal(title: "Hello", duration: 5, id: 5)]

    override func viewDidLoad() {
        super.viewDidLoad()
        loadGoals()
        
    }
    
    func loadGoals(){
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return currentGoals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Goal")!
        cell.textLabel?.text = "Hey"
        return cell
    }

    

}
