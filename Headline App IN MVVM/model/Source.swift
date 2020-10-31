//
//  Source.swift
//  Headline App IN MVVM
//
//  Created by hosam on 10/31/20.
//

import Foundation


class Source {
    
    var id :String
    var name :String
    var description :String
    
    init(id :String, name :String, description :String) {
        self.id = id
        self.name = name
        self.description = description
    }
    
    init(sourceViewModel :SourceViewModel) {
        self.id = sourceViewModel.id
        self.name = sourceViewModel.name
        self.description = sourceViewModel.description
    }
    
    init?(dictionary :[String:Any]) {
        
        guard let id = dictionary["id"] as? String,
              let name = dictionary["name"] as? String,
            let description = dictionary["description"] as? String else {
                return nil
        }
        
        self.id = id
        self.name = name
        self.description = description
    }
}
