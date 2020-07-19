//
//  BreedTableViewCell.swift
//  TheCatApi
//
//  Created by Jernard Ducon on 18/07/20.
//  Copyright © 2020 Jernard Ducon. All rights reserved.
//

import UIKit

class BreedTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var temperamentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initCell(name: String, temperament: String){
        nameLabel.text = name
        temperamentLabel.text = "Hi i'm: \n\(temperament)"
    }

}
