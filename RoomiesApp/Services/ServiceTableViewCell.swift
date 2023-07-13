//
//  ServiceTableViewCell.swift
//  RoomiesApp
//
//  Created by MIGUEL MEXICANO HERRERA on 7/31/19.
//  Copyright © 2019 Miguel Mexicano. All rights reserved.
//

import UIKit

class ServiceTableViewCell: UITableViewCell {
    @IBOutlet weak var serviceTitle: UILabel!
    @IBOutlet weak var amount: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
