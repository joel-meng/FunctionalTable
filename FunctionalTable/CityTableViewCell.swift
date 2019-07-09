//
//  CityTableViewCell.swift
//  TableViewPlay
//
//  Created by Joel Meng on 7/2/19.
//  Copyright © 2019 Joel Meng. All rights reserved.
//

import UIKit
import Reflex

class CityTableViewCell: ReflexTableViewCell<City> {

    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var detailLabel: UILabel!
    
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var betweenLableConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        titleLabel.text = nil
        detailLabel.text = nil
        descriptionLabel.text = nil
    }
    
    override func config(_ city: City) {
        titleLabel.text = city.name
        detailLabel.text = city.country
        descriptionLabel.text = city.shortDescription
        
        if (descriptionLabel.text == nil || descriptionLabel.text!.isEmpty == true) {
            betweenLableConstraint.constant = 0
        } else {
            betweenLableConstraint.constant = 15
        }
    }
}
