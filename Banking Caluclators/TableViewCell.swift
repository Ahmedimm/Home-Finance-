//
//  TableViewCell.swift
//  Home Finance
//
//  Created by Ahmed Ibrahim on 01/06/2019.
//  Copyright © 2019 Ahmed Ibrahim. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelRR: UILabel!
    @IBOutlet weak var profitLabel: UILabel!
    @IBOutlet weak var principleLabel: UILabel!
    @IBOutlet weak var balance: UILabel!
        
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}


