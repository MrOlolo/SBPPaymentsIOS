//
//  UIView+RoundCorners.swift
//  SBPWidget
//
//  Created by Mykola Hordynchuk on 6/9/19.
//  Copyright © 2019 Mykola Hordynchuk. All rights reserved.
//

import UIKit

extension UIView {
  func round(corners: CACornerMask = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner], radius: CGFloat) {
    if #available(iOS 11, *) {
      layer.cornerRadius = radius
      layer.maskedCorners = corners
    } else {
      var cornerMask = UIRectCorner()
      
      if corners.contains(.layerMinXMinYCorner) { cornerMask.insert(.topLeft) }
      if corners.contains(.layerMaxXMinYCorner) { cornerMask.insert(.topRight) }
      if corners.contains(.layerMinXMaxYCorner) { cornerMask.insert(.bottomLeft) }
      if corners.contains(.layerMaxXMaxYCorner) { cornerMask.insert(.bottomRight) }
      
      round(corners: cornerMask, radius: radius)
    }
  }
  
  func round(corners: UIRectCorner, radius: CGFloat) {
    let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
    let mask = CAShapeLayer()
    mask.path = path.cgPath
    self.layer.mask = mask
  }
}
