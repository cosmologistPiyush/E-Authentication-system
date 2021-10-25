//
//  ViewController.swift
//  E-Authentication App
//
//  Created by Piyush Sachdeva on 31/01/21.
//  Copyright © 2021 Piyush Sachdeva. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    static var data = [Data]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Accounts"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createNew))
    }
    
    @objc func createNew() {
        let ac = UIAlertController(title: "Generate", message: "What do you want to generate?", preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "OTP", style: .default, handler: genOtp))
        ac.addAction(UIAlertAction(title: "QR Code", style: .default, handler: genQR))
        ac.popoverPresentationController?.barButtonItem = navigationItem.leftBarButtonItem
        present(ac, animated: true)
    }
    
    func genOtp(action: UIAlertAction) {
        if let vc = storyboard?.instantiateViewController(identifier: "genOtp") as? OTPGenerator {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func genQR(action: UIAlertAction) {
        if let vc = storyboard?.instantiateViewController(identifier: "genQR") as? QRGenerator {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewController.data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Account", for: indexPath)
        cell.textLabel?.text = ViewController.data[indexPath.row].name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch ViewController.data[indexPath.row].type {
        case .QR:
            if let vc = storyboard?.instantiateViewController(identifier: "QR") as? QRViewController {
                vc.data = ViewController.data[indexPath.row]
                navigationController?.pushViewController(vc, animated: true)
            }
        
        case .OTP:
            if let vc = storyboard?.instantiateViewController(identifier: "OTP") as? OTPViewController {
                navigationController?.pushViewController(vc, animated: true)
            }
        }
    }

}

