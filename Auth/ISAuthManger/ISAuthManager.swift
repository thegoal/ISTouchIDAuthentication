//
//  AuthManager.swift
//  Touch_Auth
//
//  Created by Stella Pak on 25/02/2019.
//  Copyright © 2019 Stella Pak. All rights reserved.
//

import UIKit
import Foundation;
import LocalAuthentication;

protocol ISAuthManagerDelegate: class {
    func didAuthenticate(manger:ISAuthManager,message:String)
}

class ISAuthManager: NSObject {
    weak var delegate: ISAuthManagerDelegate?
    func authWithTouchID() {
        let context = LAContext()
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Authenticate demo Touch ID"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason, reply:
                {(succes, error) in
                    if succes {
                        let message = ISUtility.compareWithOldEvaluatedData(data: context.evaluatedPolicyDomainState! as NSData)
                        self.delegate?.didAuthenticate(manger:self,message: message)
                    } else {
                        self.delegate?.didAuthenticate(manger:self,message:error?.localizedDescription ?? "Touch ID Authentication Failed")
                    }
                    } as (Bool, Error?) -> Void)
        } else {
            delegate?.didAuthenticate(manger:self,message: "Touch ID Not Available")
        }
    }
}
