//
//  ViewController.swift
//  recipe1
//
//  Created by 吴世杭 on 25/08/2017.
//  Copyright © 2017 吴世杭. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.rowHeight = 70
        tableView.backgroundView = UIImageView(image: UIImage(named: "breads"))
        
        NSUserDefaultsManager.initializeDefaults()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
        navigationController?.navigationBar.alpha = 0.5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RecipeManager.recipes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath as IndexPath) as! customcell
        if (indexPath.item % 2 == 0) {
            cell.backgroundColor = UIColor.clear
        }
        else {
            cell.backgroundColor = UIColor.white.withAlphaComponent(0.2)
            cell.textLabel?.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        }
        
        cell.textLabel?.textColor = UIColor.white
        let recipe = RecipeManager.recipes[indexPath.item]
        cell.textLabel?.text = recipe.title
        cell.recipe = recipe
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete) {
            RecipeManager.DeleteRecipe(id: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "detailView") {
            let cell = sender as! customcell
            let detailView = segue.destination as! DetailViewController
            detailView.preRecipe = cell.recipe
        }
    }
}

