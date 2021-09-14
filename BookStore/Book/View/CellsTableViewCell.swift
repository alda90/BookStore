//
//  CellsTableViewCell.swift
//  BookStore
//
//  Created by AlDAIR cARRILO  on 13/09/21.
//  Copyright © 2021 CGTI. All rights reserved.
//

import UIKit

class CellsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var viewBack: UIView!
    
    @IBOutlet weak var imgBook: UIImageView!
    @IBOutlet weak var titleBook: UILabel!
    @IBOutlet weak var authorTitle: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
