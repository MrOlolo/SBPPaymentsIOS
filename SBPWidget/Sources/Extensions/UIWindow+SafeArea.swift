//
//  UIWindow+SafeArea.swift
//  SBPWidget
//
//  Created by Mykola Hordynchuk on 17.03.2021.
//

import UIKit

extension UIWindow {
  static var safeAreaTopBottomHeight: CGFloat {
    var safeAreaHeight: CGFloat = 20
    if #available(iOS 11.0, *) {
      if let window = UIApplication.shared.keyWindow {
        safeAreaHeight = window.safeAreaInsets.bottom
      }
    }
    return safeAreaHeight
  }
  
  static var safeAreaTopHeight: CGFloat {
    var safeAreaHeight: CGFloat = 20
    if #available(iOS 11.0, *) {
      if let window = UIApplication.shared.keyWindow {
        safeAreaHeight = window.safeAreaInsets.top
      }
    }
    return safeAreaHeight
  }
}
