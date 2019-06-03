//
//  RepaymentCell.swift
//  Banking Caluclators
//
//  Created by Ahmed Ibrahim on 13/06/2017.
//  Copyright © 2017 Ahmed Ibrahim. All rights reserved.
//

import UIKit

class RepaymentCell: UITableViewCell {

    @IBOutlet weak var month: UILabel!
    @IBOutlet weak var principle: UILabel!
    @IBOutlet weak var profit: UILabel!
    @IBOutlet weak var balance: UILabel!
    

    func configureCell (MortgageCalc : MortgageCalcVC) {
        
        month.text = "1"
        
        var FA = Double(MortgageCalc.financeAmount.text!)
        if (MortgageCalc.financeAmount.text == ""){
            FA = 0
        }

        var PR = Double(MortgageCalc.profitRate.text!)
        if (MortgageCalc.profitRate.text == ""){
            PR = 0
        }
        
        let montlyProfit = FA! * PR! / 12
        profit.text = "\(montlyProfit)"
        
        var T = Double(MortgageCalc.term.text!)
        if (MortgageCalc.term.text == ""){
            T = 0
        }
        
        let _: Double = FA! * (((PR!/1200) * pow((1+(PR!/1200)), T!))/(pow((1+(PR!/1200)), T!)-1))
        
    }
    
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
