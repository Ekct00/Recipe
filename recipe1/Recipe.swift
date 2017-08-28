//
//  Recipe.swift
//  Recipe
//
//  Created by 吴世杭 on 27/08/2017.
//  Copyright © 2017 吴世杭. All rights reserved.
//

import UIKit

class Recipe: NSObject, NSCoding {
    var title: String?
    var content: String?
    
    init(title: String, content: String) {
        self.title = title
        self.content = content
    }
    
    override init() {
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        if let titleDecoded = aDecoder.decodeObject(forKey: "title") as? String {
            title = titleDecoded
        }
        
        if let contentDecoded = aDecoder.decodeObject(forKey: "content") as? String {
            content = contentDecoded
        }
    }
    
    func encode(with aCoder: NSCoder) {
        if let titleEncoded = title {
            aCoder.encode(titleEncoded, forKey:"title")
        }
        
        if let contentEncoded = title {
            aCoder.encode(contentEncoded, forKey:"content")
        }
    }
}
