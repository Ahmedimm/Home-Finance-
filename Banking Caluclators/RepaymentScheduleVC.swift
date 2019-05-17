//
//  RepaymentSchedule.swift
//  Banking Caluclators
//
//  Created by Ahmed Ibrahim on 02/06/2017.
//  Copyright © 2017 Ahmed Ibrahim. All rights reserved.
//

import UIKit

class RepaymentScheduleVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBAction func BackButtomPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var FinanceAmountLabel: UILabel!
    @IBOutlet weak var TermLabel: UILabel!
    @IBOutlet weak var ProfitRateLabel: UILabel!
    @IBOutlet weak var totalProfit: UILabel!
    @IBOutlet weak var RepaymentSchedule: UITableView!
    

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (TermLabel.text == ""){
            return 1
        }
        return Int(Double(TermLabel.text!)!)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repaymentCell", for: indexPath)
        return cell
    }
    
    
    
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
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        RepaymentSchedule.delegate = self
        RepaymentSchedule.dataSource = self
        
        FinanceAmountLabel.text = _financeAmount
        TermLabel.text = _term
        ProfitRateLabel.text = _profitRate
        totalProfit.text = _totalProfit
        
    }
    

    
    }



