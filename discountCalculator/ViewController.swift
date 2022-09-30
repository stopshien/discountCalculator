//
//  ViewController.swift
//  discountCalculator
//
//  Created by stopshien on 2022/6/22.
//

import UIKit

class ViewController: UIViewController {
    
    var totalMath : Double = 0
    var discountMath : Double = 0
    var averageMath : Double = 0
    

    @IBOutlet weak var txtPrice: UITextField!
    
    
    @IBOutlet weak var txtAmount: UITextField!
    
    @IBOutlet weak var TotalLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var AverangeLabel: UILabel!
    
    @IBOutlet weak var discountOutlet: UIButton!
    @IBOutlet weak var disFuncLabel: UILabel!
   
    
    @IBOutlet weak var txtNumber: UITextField!
    
    @IBOutlet weak var txtdiscount: UITextField!
    
    //點擊空白處收合鍵盤
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        something()
//        discountOutlet.showsMenuAsPrimaryAction = true
//        discountOutlet.menu = UIMenu(children: [
//             UIAction(title: "第二件8折", handler: { action in
//                 self.disFuncLabel.text = "第二件八折"
//                 self.disCountFunc(disNumber: 0.8)
//             }),
//             UIAction(title: "第二件7折", handler: { action in
//                 self.disFuncLabel.text = "第二件七折"
//                 self.disCountFunc(disNumber: 0.7)
//             }),
//             UIAction(title: "第二件6折", handler: { action in
//                 self.disFuncLabel.text = "第二件六折"
//                 self.disCountFunc(disNumber: 0.6)
//             }),
//             UIAction(title: "第二件5折", handler: { action in
//                 self.disFuncLabel.text = "第二件五折"
//                 self.disCountFunc(disNumber: 0.5)
//             })
//
//         ])

    }
    
    func something(){
        discountOutlet.showsMenuAsPrimaryAction = true
        discountOutlet.menu = UIMenu(children: [
             UIAction(title: "第二件8折", handler: { action in
                 self.disFuncLabel.text = "第二件八折"
                 self.disCountFunc(disNumber: 0.8)
                 self.txtPrice.resignFirstResponder()
                 self.txtAmount.resignFirstResponder()
             }),
             UIAction(title: "第二件7折", handler: { action in
                 self.disFuncLabel.text = "第二件七折"
                 self.disCountFunc(disNumber: 0.7)
                 self.txtPrice.resignFirstResponder()
                 self.txtAmount.resignFirstResponder()
             }),
             UIAction(title: "第二件6折", handler: { action in
                 self.disFuncLabel.text = "第二件六折"
                 self.disCountFunc(disNumber: 0.6)
                 self.txtPrice.resignFirstResponder()
                 self.txtAmount.resignFirstResponder()
             }),
             UIAction(title: "第二件5折", handler: { action in
                 self.disFuncLabel.text = "第二件五折"
                 self.disCountFunc(disNumber: 0.5)
                 self.txtPrice.resignFirstResponder()
                 self.txtAmount.resignFirstResponder()
             })
             
         ])
        
    }
   
    func disCountFunc(disNumber: Double){
      
        if txtPrice.text != "" && txtAmount.text != ""{
            if (Int(txtAmount.text!)! % 2 != 0) {
                totalMath = (((Double(txtAmount.text!)! / 2) - 0.5) * Double(txtPrice.text!)! * disNumber) +
                ((Double(txtAmount.text!)! / 2) + 0.5) * Double(txtPrice.text!)!
            }else{
                totalMath = (Double(txtAmount.text!)! / 2) * (1 + disNumber) * Double(txtPrice.text!)!
            }
            
            discountMath = Double(txtPrice.text!)! * Double(txtAmount.text!)! - totalMath
            
            averageMath = totalMath / Double(txtAmount.text!)!
            
        }else{}
        
        TotalLabel.text = String(format:"%.2f" ,totalMath)
        discountLabel.text = String(format:"%.2f" , discountMath)
        AverangeLabel.text = String(format:"%.2f" , averageMath)
        
        txtNumber.text = ""
        txtdiscount.text = ""
        
    }
    
    @IBAction func calcaulatorButton(_ sender: Any) {
        
       
        if txtdiscount.text != "" && txtNumber.text != "" && txtPrice.text != "" && txtAmount.text != ""{
            var floorMath : Double = 0
            floorMath = floor(Double(txtAmount.text!)! / Double(txtNumber.text!)!)
            
                totalMath = (floorMath * Double(txtPrice.text!)! * Double(txtdiscount.text!)!) / 10 + (Double(txtAmount.text!)! - floorMath) * Double(txtPrice.text!)!
            
            discountMath = Double(txtPrice.text!)! * Double(txtAmount.text!)! - totalMath
            
            averageMath = totalMath / Double(txtAmount.text!)!
            print(floorMath)
            
            self.txtPrice.resignFirstResponder()
            self.txtAmount.resignFirstResponder()
            self.txtNumber.resignFirstResponder()
            self.txtdiscount.resignFirstResponder()
            
        }else{}
        
        
        TotalLabel.text = String(format:"%.2f" ,totalMath)
        discountLabel.text = String(format:"%.2f" , discountMath)
        AverangeLabel.text = String(format:"%.2f" , averageMath)
        disFuncLabel.text = "請選擇方案"
        
        self.txtPrice.resignFirstResponder()
        self.txtAmount.resignFirstResponder()
        self.txtNumber.resignFirstResponder()
        self.txtdiscount.resignFirstResponder()
    }
    
    
    
}

