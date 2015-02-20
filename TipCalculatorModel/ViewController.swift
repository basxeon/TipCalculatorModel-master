//
//  ViewController.swift
//  TipCalculatorModel
//
//  Created by iStudents on 2/6/15.
//  Copyright (c) 2015 iStudents. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshUI()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var totalTextField: UITextField!
    @IBOutlet weak var taxPactlabel: UILabel!
   
    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var taxPactslider: UISlider!

    
    
    let tipCalc = TipCalculatorModel(total: 33.25, taxPct: 0.06)
    var possibleTips = Dictionary<Int, (tipAmt:Double, total:Double)>()
    var sortedKeys:[Int] = []
    
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedKeys.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell! {
        
        var cell = UITableViewCell(style: UITableViewCellStyle.Value2, reuseIdentifier: nil)
        
        let tipPct = sortedKeys[indexPath.row]
        let tipAmt = possibleTips[tipPct]!.tipAmt
        let total = possibleTips[tipPct]!.total
        
        cell.textLabel!.text = "\(tipPct)%:"
        cell.detailTextLabel!.text = String(format: "Tip: $%0.2F, Total: $%0.2f", tipAmt,total)
        
        return cell
    }
    

    @IBAction func calculateTapped(sender: AnyObject){
        
        tipCalc.total = Double((totalTextField.text as NSString).doubleValue)
        possibleTips = tipCalc.returnPossibleTips()
        sortedKeys = sorted(Array(possibleTips.keys))
        tableview.reloadData()
    }
    
    @IBAction func taxPercentageChanged(sender: AnyObject) {
        tipCalc.taxPct = Double(taxPactslider.value)/100.0
        refreshUI()
    }
    
    @IBAction func viewTapped(sender: AnyObject) {
        totalTextField.resignFirstResponder()
    }
    

    
    func refreshUI(){
        
        totalTextField.text = String(format: "%0.2f",tipCalc.total)
        
        taxPactslider.value = Float(tipCalc.taxPct) * 100.0
        
        taxPactlabel.text = "Tax Percentage (\(Int(taxPactslider.value))%)"
        
    
    }

}

