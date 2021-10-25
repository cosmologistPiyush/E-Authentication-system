//
//  QRViewController.swift
//  E-Authentication App
//
//  Created by Piyush Sachdeva on 31/01/21.
//  Copyright © 2021 Piyush Sachdeva. All rights reserved.
//

import UIKit

class QRViewController: UIViewController {
    
    var data: Data?
    @IBOutlet weak var qrImageView: UIImageView!
    @IBOutlet weak var timeRemainingLabel: UILabel!
    
    var counter = 30
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let name = data?.name {
            let qrData = "\(name)\n\(String(describing: time))"
            let imageData = qrData.data(using: String.Encoding.ascii)
            let filter = CIFilter(name: "CIQRCodeGenerator")
            filter?.setValue(imageData, forKey: "inputMessage")
            let image = UIImage(ciImage: (filter?.outputImage)!)
            qrImageView.image = image
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    @objc func shareTapped() {
        let ac = UIActivityViewController(activityItems: [qrImageView.image!], applicationActivities: [])
        ac.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(ac, animated: true)
    }
    
    @objc func timerAction() {
        if (Int(timeRemainingLabel.text ?? "") == 0){
            timer.invalidate()
            timeRemainingLabel.text = "QR Expired!!"
        }
        else{
            counter -= 1
            timeRemainingLabel.text = "\(counter)"
        }
    }
}
