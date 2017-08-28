//
//  DetailViewController.swift
//  Recipe
//
//  Created by 吴世杭 on 27/08/2017.
//  Copyright © 2017 吴世杭. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var preRecipe:Recipe?
    @IBOutlet weak var recipleContent: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        recipleContent.backgroundColor = UIColor.black.withAlphaComponent(0.2)
    }

    override func viewDidAppear(_ animated: Bool) {
        self.title = preRecipe?.title
        self.recipleContent.text = preRecipe?.content
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
