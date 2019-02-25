//
//  Utility.swift
//  Auth
//
//  Created by Stella Pak on 22/02/2019.
//  Copyright © 2019 Stella Pak. All rights reserved.
//

import UIKit


class ISUtility: NSObject {
    
    class func userDefaultsSet(data:NSData ,key: String) {
        UserDefaults.standard.set(data, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    class func userDefaultsGet(key:String) -> NSData {
        guard let data = UserDefaults.standard.data(forKey: key)  else {
            return NSData.init()
        }
        return data as NSData
    }
    class func removeUserDefaults() {
        UserDefaults.standard.removeObject(forKey: ISConstants.evaluatedState)
        UserDefaults.standard.synchronize()
    }
    
    class func compareWithOldEvaluatedData(data:NSData) -> String {
        if data.length>0 {
            let oldData:NSData = self.userDefaultsGet(key: ISConstants.evaluatedState) as NSData
            if oldData.length>0{
                if oldData .isEqual(to: data as Data) {
                    return "Touch ID Authnetication Successfull"
                }else{
                    return "Touch ID Finger changed,Please tap on reset"
                }
            }else{
                self.userDefaultsSet(data: data, key: ISConstants.evaluatedState)
                return "Touch ID Authneticated First Time"
            }
        }else{
            return "Touch ID Authnetication failed"
        }
    }
}
