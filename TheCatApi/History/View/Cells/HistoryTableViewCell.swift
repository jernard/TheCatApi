//
//  HistoryTableViewCell.swift
//  TheCatApi
//
//  Created by Jernard Ducon on 18/07/20.
//  Copyright © 2020 Jernard Ducon. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var dislikeImg: UIImageView!
    @IBOutlet weak var likeImg: UIImageView!
    @IBOutlet weak var kittyImg: UIImageView!
    @IBOutlet weak var nameKittyLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        likeImg.alpha = 0
        dislikeImg.alpha = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUp(model: votingModel){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MMM-dd HH:mm:ss"
        kittyImg.downloaded(from: model.url ?? "")
        nameKittyLbl.text = model.name
        if let date = model.date{
            dateLbl.text = formatter.string(from: date)
        }else{
            dateLbl.text = "Date no available"
        }
        switch model.voted {
        case 1:
            likeImg.alpha = 1
            dislikeImg.alpha = 0
        case 0:
            likeImg.alpha = 0
            dislikeImg.alpha = 1
        default:
            break
        }
    }
}
