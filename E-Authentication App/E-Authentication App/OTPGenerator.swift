//
//  OTPGenerator.swift
//  E-Authentication App
//
//  Created by Piyush Sachdeva on 09/03/21.
//  Copyright © 2021 Piyush Sachdeva. All rights reserved.
//

import UIKit

class OTPGenerator: UIViewController {

    @IBOutlet weak var otpLabel: UILabel!
    @IBOutlet weak var optname: UITextField!
    @IBOutlet weak var otpDescription: UITextField!
    @IBOutlet weak var otpPurpose: UITextField!
    
    var code = [Int]()
    var label = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveData))
        let share = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareCode))
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbarItems = [spacer, share]
        navigationController?.isToolbarHidden = false
        for _ in 0..<6 {
            let randomInt = Int.random(in: 0...9)
            code.append(randomInt)
        }
        
        for  i in 0..<6 {
            let temp = "\(code[i])"
            label = label + temp
        }
        otpLabel.text = label
        

        // Do any additional setup after loading the view.
    }
    @objc func shareCode() {
        let ac =  UIActivityViewController(activityItems: [label, "Your OTP is: \(label)"], applicationActivities: [])
        ac.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(ac, animated: true)
    }
    
    @objc func saveData() {
        if let name = optname.text, let desc = otpDescription.text, let purpose = otpPurpose.text {
            let newInstance = Data(type: .OTP, name: name, description: desc, purpose: purpose)
            if let vc = storyboard?.instantiateViewController(identifier: "Main") as? ViewController {
                ViewController.data.append(newInstance)
                present(vc, animated: true)
            }
        }
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
