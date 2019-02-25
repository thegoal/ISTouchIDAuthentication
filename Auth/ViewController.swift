//
//  ViewController.swift
//  Auth
//
//  Created by Stella Pak on 20/02/2019.
//  Copyright © 2019 Stella Pak. All rights reserved.
//

import UIKit
import Foundation;

class ViewController: UIViewController,ISAuthManagerDelegate {
    var authManager:ISAuthManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authManager = ISAuthManager()
        authManager?.delegate = self
    }
    
    @IBAction func authWithTouchID(_ sender: Any) {
        authManager?.authWithTouchID()
    }
    
    @IBAction func resetTouchID(_ sender: Any) {
        ISUtility.removeUserDefaults() // Remove older from user defaults
        authManager?.authWithTouchID()
    }
    
    // MARK: Show error or success method
    
    func showAlertController(_ message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK: AuthManager Delegate
    
    func didAuthenticate(manger: ISAuthManager, message: String) {
        self.showAlertController(message)
    }
    
}

