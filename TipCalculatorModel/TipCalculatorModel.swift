//
//  TipCalculatorModel.swift
//  TipCalculatorModel
//
//  Created by iStudents on 2/6/15.
//  Copyright (c) 2015 iStudents. All rights reserved.
//

class TipCalculatorModel{
    
    
    var total: Double
    var taxPct: Double
    var subtotal: Double{
    
    get {
            return total / (taxPct+1)
        }
    }
    init(total:Double, taxPct:Double){
        self.total = total
        self.taxPct = taxPct
    }
    func calcTipWithTipPct(tipPct:Double) -> (tipAmt:Double, total:Double) {
        
        let tipAmt = subtotal * tipPct
        let finalTotal = total * tipAmt
        return (tipAmt, finalTotal)
    }
    func returnPossibleTips() -> [Int: (tipAmt:Double, total:Double)]{
        
        let possibleTipsInferred = [0.15, 0.18, 0.20]
        let possibleTipsExplicit: [Double] = [0.15, 0.18, 0.20]
    
        var retval = Dictionary<Int, (tipAmt:Double, total:Double)>()
        for possibleTip in possibleTipsInferred{
            let intPac = Int(possibleTip*100)
            retval[intPac] = calcTipWithTipPct(possibleTip)
        }
            return retval
    
    }
}