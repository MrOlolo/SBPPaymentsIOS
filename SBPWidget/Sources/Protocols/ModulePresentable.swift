//
//  File.swift
//  SBPWidget
//
//  Created by Mykola Hordynchuk on 6/9/19.
//  Copyright © 2019 Mykola Hordynchuk. All rights reserved.
//

import UIKit

protocol ModuleViewable: AnyObject {
  var viewController: UIViewController {get}
}


extension UIViewController: ModuleViewable {}


extension ModuleViewable where Self: UIViewController {
  var viewController: UIViewController { return self }
}
