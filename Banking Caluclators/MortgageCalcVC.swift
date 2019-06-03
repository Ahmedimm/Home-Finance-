//
//  ViewController.swift
//  Banking Caluclators
//
//  Created by Ahmed Ibrahim on 19/05/2017.
//  Copyright © 2017 Ahmed Ibrahim. All rights reserved.

import UIKit


class MortgageCalcVC: UIViewController, UITextFieldDelegate {
    

    @IBOutlet weak var propertyValue: UITextField!
    @IBOutlet weak var downpayment: UITextField!
    @IBOutlet weak var additionalFinance: UITextField!
    @IBOutlet weak var profitRate: UITextField!
    @IBOutlet weak var term: UITextField!
    @IBOutlet weak var EMI: UITextField!
    @IBOutlet weak var financeAmount: UILabel!
    @IBOutlet weak var totalProfit: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.propertyValue.delegate = self
        self.downpayment.delegate = self
        self.additionalFinance.delegate = self
        self.profitRate.delegate = self
        self.term.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func Calculate(_ sender: Any) {

//        var financeDetails = FinanceDetails()

        var PV = Double(propertyValue.text!)
        if (propertyValue.text == ""){
            PV = 0
        }
        
        var DP = Double(downpayment.text!)
        if (downpayment.text == ""){
            DP = 0
        }
        
        var LI = Double(additionalFinance.text!)
        if (additionalFinance.text == ""){
            LI = 0
        }
        
        var PR = Double(profitRate.text!)
        if (profitRate.text == ""){
            PR = 0
        }
        
        var T = Double(term.text!)
        if (term.text == ""){
            T = 1
        }
        
        let FA = PV! - DP! + LI!
        
        let formater = NumberFormatter()
        formater.groupingSeparator = ","
        formater.numberStyle = .decimal
        let formattedFA = formater.string(from: NSNumber(value: round(FA)))
        financeAmount.text = "\(formattedFA!)"
        
        let E: Double = FA * (((PR!/1200) * pow((1+(PR!/1200)), T!))/(pow((1+(PR!/1200)), T!)-1))
        let formattedE = formater.string(from: NSNumber(value: round(E)))
        EMI.text = "Monthly Installment \(String(formattedE!))"
    
        let TP: Double = ((round(E) * T!) - FA)
        let formattedTP = formater.string(from: NSNumber(value: round(TP)))
        totalProfit.text = "\(formattedTP!)"
        
    }
    
    @IBAction func FinanceDetialsPressed(_ sender: Any) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destination1 = segue.destination as! RepaymentScheduleVC
        destination1.sentPropertyValue = propertyValue.text!
        
        let destination2 = segue.destination as! RepaymentScheduleVC
        destination2.sentDownpayment = downpayment.text!
        
        let destination3 = segue.destination as! RepaymentScheduleVC
        destination3.sentAdditionalFinance = additionalFinance.text!
        
        let destination4 = segue.destination as! RepaymentScheduleVC
        destination4.sentprofitRate = profitRate.text!
        
        let destination5 = segue.destination as! RepaymentScheduleVC
        destination5.sentterm = term.text!
        
        let destination6 = segue.destination as! RepaymentScheduleVC
        destination6.sentFinanceAmuont = financeAmount.text!
        
        let destination7 = segue.destination as! RepaymentScheduleVC
        destination7.sentTotalProfit = totalProfit.text!
        
        let destination8 = segue.destination as! RepaymentScheduleVC
        destination8.sentEMI = EMI.text!
        

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}


