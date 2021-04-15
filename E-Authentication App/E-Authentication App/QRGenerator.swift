//
//  QRGenerator.swift
//  E-Authentication App
//
//  Created by Piyush Sachdeva on 09/03/21.
//  Copyright © 2021 Piyush Sachdeva. All rights reserved.

import UIKit

class QRGenerator: UIViewController {

    @IBOutlet weak var qrImg: UIImageView!
    @IBOutlet weak var nameQR: UITextField!
    @IBOutlet weak var descQR: UITextField!
    @IBOutlet weak var purposeQR: UITextField!
    
    var temp: UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveData))
            
    }
    
    @IBAction func generate(_ sender: UIButton) {
        if let name = nameQR.text {
            let qrData = "\(name)\n\(String(describing: time))"
            let imageData = qrData.data(using: String.Encoding.ascii)
            let filter = CIFilter(name: "CIQRCodeGenerator")
            filter?.setValue(imageData, forKey: "inputMessage")
            let image = UIImage(ciImage: (filter?.outputImage)!)
            qrImg.image = image
        }
    }
    
    @objc func saveData() {
        if let name = nameQR.text, let desc = descQR.text, let purpose = purposeQR.text {
            let newInstance = Data(type: .QR, name: name, description: desc, purpose: purpose)
            if let vc = storyboard?.instantiateViewController(identifier: "Main") as? ViewController {
                ViewController.data.append(newInstance)
                navigationController?.pushViewController(vc, animated: true)
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
