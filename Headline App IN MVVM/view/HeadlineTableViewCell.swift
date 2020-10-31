//
//  HeadlineTableViewCell.swift
//  Headline App IN MVVM
//
//  Created by hosam on 10/31/20.
//

import UIKit

class HeadlineTableViewCell: UITableViewCell {
    
    var source:Headline? {
        didSet{
            guard let source = source else { return  }
            titleLabel.text = source.title
            descriptionLabel.text=source.description
           
        }
    }
    
  
    

    lazy var titleLabel = UILabel(text: "asd", font: .systemFont(ofSize: 20, weight: .bold), textColor: .black)
    lazy var descriptionLabel = UILabel(text: "sdfdsfdsf", font: .systemFont(ofSize: 16, weight: .bold), textColor: .black,numberOfLines: 0)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews()  {
        backgroundColor = .white
        stack(titleLabel,descriptionLabel).withMargins(.allSides(16))
    }
}
