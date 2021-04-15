//
//  OTPViewController.swift
//  E-Authentication App
//
//  Created by Piyush Sachdeva on 31/01/21.
//  Copyright © 2021 Piyush Sachdeva. All rights reserved.
//

import UIKit

class OTPViewController: UIViewController {

    var code = [Int]()
    var label = String()
    @IBOutlet weak var otpCodeLabel: UILabel!
    @IBOutlet weak var timeRemainingLabel: UILabel!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        for _ in 0..<6 {
            let randomInt = Int.random(in: 0...9)
            code.append(randomInt)
        }
        
        for  i in 0..<6 {
            let temp = "\(code[i])"
            label = label + temp
        }
        otpCodeLabel.text = label
    }
        
    
    @objc func shareTapped() {
        let ac = UIActivityViewController(activityItems: [otpCodeLabel.text!], applicationActivities: [])
        ac.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(ac, animated: true)
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
