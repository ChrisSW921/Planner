//
//  GoalsListTableViewController.swift
//  Planner
//
//  Created by Chris Withers on 8/24/20.
//  Copyright © 2020 Chris Withers. All rights reserved.
//

import UIKit
import RealmSwift

class GoalsListTableViewController: UITableViewController {
    
    let realm = try! Realm()
    
    var goals: Results<Goal>?
    
    var currentGoals: [Goal] = [Goal()]

    override func viewDidLoad() {
        super.viewDidLoad()
        loadGoals()
    }
    
    func loadGoals() {
        
        goals = realm.objects(Goal.self)
        tableView.reloadData()
    }
    
    func save(goal: Goal) {
        do {
            try realm.write {
                realm.add(goal)
            }
        } catch {
            print("Error saving category \(error)")
        }
        tableView.reloadData()
    }
    
    @IBAction func addPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add a New Goal", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            let newGoal = Goal()
            newGoal.title = textField.text!
            newGoal.duration = 0
            newGoal.id = Int.random(in: 1000000...10000000)
            self.save(goal: newGoal)
        }
    
    
        alert.addAction(action)
        alert.addTextField { (field) in
            textField = field
            textField.placeholder = "Add a new goal"
        }
        present(alert, animated: true, completion: nil)
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return goals?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Goal")!
        cell.textLabel?.text = goals?[indexPath.row].title ?? "No goals yet!"
        return cell
    }

    

}
