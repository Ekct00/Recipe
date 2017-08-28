//
//  RecipeManager.swift
//  Recipe
//
//  Created by 吴世杭 on 27/08/2017.
//  Copyright © 2017 吴世杭. All rights reserved.
//

import UIKit

class RecipeManager: NSObject {
    static var recipes = [Recipe]()
    
    class func AddRecipe(title: String, content:String){
        let r = Recipe(title: title, content: content)
        recipes.append(r)
    }
    
    class func DeleteRecipe(id: Int) {
        recipes.remove(at: id)
    }
    
    class func GetRecipe(id: Int) -> Recipe{
        if (recipes.count > 0) {
            return recipes[id]
        }
        
        return Recipe()
    }
    
}
