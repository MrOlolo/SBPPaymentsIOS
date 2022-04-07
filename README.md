# SBPPayment (old SBPWidget)

### Preview
![preview](art/preview.jpg)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- iOS 13.0+ 
- Swift 5.0+

## Installation

To install it, simply add the following line to your Podfile:

```ruby
s.dependency 'SBPayment'
```

## Quick Start

```swift
import UIKit
import SBPWidget

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    SBPWidgetModule().show(on: self) { scheme in
      print(scheme)
    }
  }
}
```

also you need add <b>LSApplicationQueriesSchemes</b> key into you project <b>info.plst</b> 

```plst
 <key>LSApplicationQueriesSchemes</key>
  <array>
    <string>bank100000000000</string>
    <string>bank100000000001</string>
    ...
    <string>bank100000000999</string>
    <string>bank100000001000</string>
  </array>
```

<b>Warning!</b> Starting with iOS 15 there's limit in maximum 50 entries in list, so you probably need to take first 50 entries from [c2bmembers.json](https://qr.nspk.ru/proxyapp/c2bmembers.json). Look for details [here](https://developer.apple.com/documentation/uikit/uiapplication/1622952-canopenurl#discussion).

That's need for ```UIApplication.shared.canOpenURL``` method worked correctly.
You can copy and paste all lines from example

## License

SBPWidget is available under the MIT license. See the LICENSE file for more info.
