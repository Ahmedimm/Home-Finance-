//
//  RepaymentSchedule.swift
//  Banking Caluclators
//
//  Created by Ahmed Ibrahim on 02/06/2017.
//  Copyright © 2017 Ahmed Ibrahim. All rights reserved.
//

import UIKit

class RepaymentScheduleVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var FinanceAmountLabel: UILabel!
    @IBOutlet weak var TermLabel: UILabel!
    @IBOutlet weak var ProfitRateLabel: UILabel!
    @IBOutlet weak var totalProfit: UILabel!
    @IBOutlet weak var RepaymentSchedule: UITableView!
    
    private var _propertyValue: String!
    var sentPropertyValue: String {
        get {
            return _propertyValue
        } set {
            _propertyValue = newValue
        }
    }
    
    private var _downpayment: String!
    var sentDownpayment: String {
        get {
            return _downpayment
        } set {
            _downpayment = newValue
        }
    }
    
    private var _additionalFinance: String!
    var sentAdditionalFinance: String {
        get {
            return _additionalFinance
        } set {
            _additionalFinance = newValue
        }
    }
    
    private var _financeAmount: String!
    var sentFinanceAmuont: String {
        get {
            return _financeAmount
        } set {
            _financeAmount = newValue
        }
    }
    
    private var _term: String!
    var sentterm: String {
        get {
            return _term
        } set {
            _term = newValue
        }
    }
    
    private var _profitRate: String!
    var sentprofitRate: String {
        get {
            return _profitRate
        } set {
            _profitRate = newValue
        }
    }
    
    private var _totalProfit: String!
    var sentTotalProfit: String {
        get {
            return _totalProfit
        } set {
            _totalProfit = newValue
        }
    }
    
    private var _EMI: String!
    var sentEMI: String {
        get {
            return _additionalFinance
        } set {
            _EMI = newValue
        }
    }
    
    var repaymentArray : [FinanceDetails] = [FinanceDetails]()

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (TermLabel.text == ""){
            return 3
        }
        return Int(Double(TermLabel.text!)!)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! TableViewCell
        
        var loan = Double(sentFinanceAmuont)
        if (sentFinanceAmuont == ""){
            loan = 0
        }
        
        var rate = Double(sentprofitRate)
        if (sentprofitRate == ""){
            rate = 0
        }
        
        var years = Double(sentterm)
        if (sentterm == ""){
            years = 1
        }
        
        var EMI = Double(sentEMI)
        if (sentEMI == ""){
            EMI = 0
        }
        
        let finaceAmount = 1000000.00
        let interestRate = 5.00
        let finacePeriod = 300.00
        let Installment = 5846.00
        
        buildRepayment(loan: finaceAmount, rate: interestRate, years: finacePeriod, installment: Installment)
    
        cell.labelRR.text = repaymentArray[indexPath.row].serial
        cell.profitLabel.text = repaymentArray[indexPath.row].profit
        cell.principleLabel.text = repaymentArray[indexPath.row].principle
        cell.balance.text = repaymentArray[indexPath.row].balance
    
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RepaymentSchedule.delegate = self
        RepaymentSchedule.dataSource = self
        
        FinanceAmountLabel.text = _financeAmount
        TermLabel.text = _term
        ProfitRateLabel.text = _profitRate
        totalProfit.text = _totalProfit
        
        RepaymentSchedule.register(UINib(nibName: "CellView", bundle: nil), forCellReuseIdentifier: "customCell")
    }
    
        func buildRepayment(loan: Double, rate: Double, years: Double, installment: Double) {
            
            let loanAmount = loan
            let intRate = rate / 1200
            let term = years
            let EMI = installment
            var balance = loanAmount
            
            let firstRepaymet = 1
            let lastRepayment = term
            let interval = 1
            
            let sequence = stride(from: firstRepaymet, to: Int(lastRepayment)+1, by: interval)
            
            for element in sequence {
           
                let interestPayment = balance * intRate
                let principalPayment = EMI - interestPayment
                balance -= principalPayment

                let repayment = FinanceDetails()
                
                let formater = NumberFormatter()
                formater.groupingSeparator = ","
                formater.numberStyle = .decimal
                let formattedIterestPapyment = formater.string(from: NSNumber(value: round(interestPayment)))
                let formattedPrinciple = formater.string(from: NSNumber(value: round(principalPayment)))
                let formattedBalance = formater.string(from: NSNumber(value: round(balance)))
                

                
                repayment.serial = "\(element)"
                repayment.principle = "\(formattedPrinciple ?? "")"
                repayment.profit = "\(formattedIterestPapyment ?? "")"
                repayment.balance = "\(formattedBalance ?? "d")"
                
                self.repaymentArray.append(repayment)
            }
        }
}



