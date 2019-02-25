# Touch Id iOS // Change of Thumb or Finger detection using iOS LocalAuthentication framework
# Swift 4.2

###### It is a swift utitlity to use touch in your application and detect if there is change in registered thumb or finger.

###### Demo project is added too.

## Usage

#### 1 - Import AuthManger folder to your project.

#### 2 - Make an instance of Auth Manger and set delgate to self.
    
        var authManager:AuthManager? = AuthManager()
        authManager?.delegate = self
  
#### 3 - Implement delegate method
    
    func didAuthenticate(manger:AuthManager,message: String) {
    }
    
#### 4 - Call authnicate method and get status message in delegate

    authManager?.authWithTouchID()
