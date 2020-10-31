//
//  SourceListViewModel.swift
//  Headline App IN MVVM
//
//  Created by hosam on 10/31/20.
//

import Foundation

class SourceListViewModel {
    
    private var webservice :Services
    private (set) var sourcesViewModel :[SourceViewModel] = [SourceViewModel]()
    private var completion :() -> Void = {  }
    
    init(webservice :Services, completion:@escaping () -> ()) {
        self.webservice = webservice
        self.completion = completion
        populateSources()
    }
    
    private func populateSources() {
        
        self.webservice.getData { sources in
            self.sourcesViewModel = sources.map(SourceViewModel.init)
            self.completion()
        }
    }
    
    func sourceAt(index :Int) -> SourceViewModel {
        return self.sourcesViewModel[index]
    }
}

class SourceViewModel {
    
    var id :String
    var name :String
    var description :String
    
    init(source :Source) {
        self.id = source.id
        self.name = source.name
        self.description = source.description
    }
    
    init(id :String, name :String, description :String) {
        self.id = id
        self.name = name
        self.description = description
    }
}
