//
//  Headline.swift
//  Headline App IN MVVM
//
//  Created by hosam on 10/31/20.
//

import Foundation

class Headline {
    
    var title :String!
    var description :String!
    
    init?(dictionary :[String:Any]) {
        
        guard let title = dictionary["title"] as? String,
            let description = dictionary["description"] as? String else {
                return nil
        }
        
        self.title = title
        self.description = description
    }
    
}
