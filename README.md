# Touch Id iOS // Change of Thumb or Finger detection // using iOS LocalAuthentication framework
# Swift 5.0

#####  A drop in solution for Touch Id Authentication Management.This utility allowss to use touch id in your application and detect if there is change in registered thumb or finger.

##### Demo project is added too.

## Usage

#### 1 - Clone this project and import AuthManger folder to your project.

#### 2 - Make an instance of Auth Manger and set delgate to self.
    
        var authManager:ISAuthManager? = ISAuthManager()
        authManager?.delegate = self
  
#### 3 - Implement delegate method.
    
    func didAuthenticate(manger:ISAuthManager,message: String) {
    }
    
#### 4 - Call authenticate method and get status message in delegate.

    authManager?.authWithTouchID()
