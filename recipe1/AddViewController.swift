//
//  AddViewController.swift
//  Recipe
//
//  Created by 吴世杭 on 27/08/2017.
//  Copyright © 2017 吴世杭. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    
    @IBOutlet weak var titleText: UITextField!
    
    @IBOutlet weak var recipleContent: UITextView!
    
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
// Do any additional setup after loading the view.
        titleText.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        recipleContent.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        
        NotificationCenter.default.addObserver(self, selector: #selector(AddViewController.textTitleDidChange), name: NSNotification.Name.UITextFieldTextDidChange, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(AddViewController.recipeContentDidChange), name: NSNotification.Name.UITextViewTextDidChange, object: nil)
        
        addButton.isEnabled = false
    }
    
    func textTitleDidChange(){
        handleDoneButtonState()
    }
    
    func recipeContentDidChange(){
        handleDoneButtonState()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func doneButton_click(_ sender: Any) {
        recipleContent.resignFirstResponder()
    }
   
    @IBAction func titileDoneButton_click(_ sender: Any) {
        titleText.resignFirstResponder()
    }
    
    func handleDoneButtonState() {
        if (recipleContent.text != "") {
            doneButton.isEnabled = true
        }
        else {
            doneButton.isEnabled = false
        }
        
        if (titleText.text != "" && recipleContent.text != "") {
            addButton.isEnabled = true
            addButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        }
        else {
            addButton.isEnabled = false
            addButton.setTitleColor(UIColor.lightGray, for: UIControlState.normal)
        }
    }

    @IBAction func addButton_click(_ sender: Any) {
        activityIndicator.startAnimating()

        RecipeManager.AddRecipe(title: titleText.text!, content: recipleContent.text)
        titleText.text = ""
        recipleContent.text = ""
        
        NSUserDefaultsManager.synchronize()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .microseconds(2000)) {
            self.activityIndicator.stopAnimating()
        }
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
