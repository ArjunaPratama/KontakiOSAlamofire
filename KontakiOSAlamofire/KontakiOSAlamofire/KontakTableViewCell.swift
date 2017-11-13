//
//  KontakTableViewCell.swift
//  KontakiOSAlamofire
//
//  Created by Jun  on 11/13/17.
//  Copyright © 2017 Arjuna. All rights reserved.
//

import UIKit

class KontakTableViewCell: UITableViewCell {

    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var labelNama: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
