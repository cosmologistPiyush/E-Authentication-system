//
//  QRViewController.swift
//  E-Authentication App
//
//  Created by Piyush Sachdeva on 31/01/21.
//  Copyright © 2021 Piyush Sachdeva. All rights reserved.
//

import UIKit

class QRViewController: UIViewController {
    
    @IBOutlet weak var qrImageView: UIImageView!

    var data: Data?
    
    @IBOutlet weak var timeRemainingLabel: UILabel!
    
    
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
    
    }
    
    @objc func shareTapped() {
        let ac = UIActivityViewController(activityItems: [qrImageView.image!], applicationActivities: [])
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
