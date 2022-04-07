//
//  UIView+Anchors.swift
//  SBPWidget
//
//  Created by Mykola Hordynchuk on 6/9/19.
//  Copyright © 2019 Mykola Hordynchuk. All rights reserved.
//

import UIKit
import Foundation

typealias ViewAnchors = (top: NSLayoutConstraint?, left: NSLayoutConstraint?, bottom: NSLayoutConstraint?, right: NSLayoutConstraint?, width: NSLayoutConstraint?, height: NSLayoutConstraint?)

extension UIView {
  func fillSuperview() {
    translatesAutoresizingMaskIntoConstraints = false
    if let superview = superview {
      leftAnchor.constraint(equalTo: superview.leftAnchor).isActive = true
      rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true
      topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
      bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
    }
  }
  
  @discardableResult
  func anchorToSuperview(t top: CGFloat? = nil, l left: CGFloat? = nil, b bottom: CGFloat? = nil, r right: CGFloat? = nil) -> UIView {
    translatesAutoresizingMaskIntoConstraints = false
    if let superview = superview {
      for (index, constant) in [top, left, bottom, right].enumerated() {
        guard let unwrapped = constant else { continue }
        switch index {
        case 0:
          topAnchor.constraint(equalTo: superview.topAnchor, constant: unwrapped).isActive = true
        case 1:
          leftAnchor.constraint(equalTo: superview.leftAnchor, constant: unwrapped).isActive = true
        case 2:
          let anchor = bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -unwrapped)//.isActive = true
          anchor.identifier = "bottom"
          anchor.isActive = true
        case 3:
          rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -unwrapped).isActive = true
        default:
          break
        }
      }
    }
    return self
  }
  
  @discardableResult
  func anchorCenterXToSuperview(_ constant: CGFloat = 0) -> UIView {
    translatesAutoresizingMaskIntoConstraints = false
    if let anchor = superview?.centerXAnchor {
      centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
    }
    return self
  }
  
  @discardableResult
  func anchorCenterXToView(_ view: UIView, constant: CGFloat = 0) -> UIView {
    translatesAutoresizingMaskIntoConstraints = false
    let anchor = view.centerXAnchor
    centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
    return self
  }
  
  @discardableResult
  func anchorCenterYToView(_ view: UIView, constant: CGFloat = 0) -> UIView {
    translatesAutoresizingMaskIntoConstraints = false
    let anchor = view.centerYAnchor
    centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
    return self
  }
  
  @discardableResult
  func anchorCenterYToSuperview(_ constant: CGFloat = 0, relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> UIView {
    translatesAutoresizingMaskIntoConstraints = false
    if let anchor = superview?.centerYAnchor {
      _ = _anchorCenterY(anchor, constant, relation: relation, priority: priority)
    }
    return self
  }
  
  @discardableResult
  func anchorCenterSuperview() -> UIView {
    anchorCenterXToSuperview()
    anchorCenterYToSuperview()
    return self
  }
  
  @discardableResult
  func anchorTop(_ top: NSLayoutYAxisAnchor, _ constant: CGFloat, relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> UIView {
    _ = _anchorTop(top, constant, relation: relation, priority: priority)
    return self
  }
  
  @discardableResult
  func anchorBottom(_ bottom: NSLayoutYAxisAnchor, _ constant: CGFloat, relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> UIView {
    _ = _anchorBottom(bottom, constant, relation: relation, priority: priority)
    return self
  }
  
  @discardableResult
  func anchorLeft(_ left: NSLayoutXAxisAnchor, _ constant: CGFloat, relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> UIView {
    _ = _anchorLeft(left, constant, relation: relation, priority: priority)
    return self
  }
  
  @discardableResult
  func anchorRight(_ right: NSLayoutXAxisAnchor, _ constant: CGFloat, relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> UIView {
    _ = _anchorRight(right, constant, relation: relation, priority: priority)
    return self
  }
  
  @discardableResult
  func anchorWidth(_ constant: CGFloat, relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> UIView {
    _ = _anchorWidth(constant, relation: relation, priority: priority)
    return self
  }
  
  @discardableResult
  func anchorHeight(_ constant: CGFloat, relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> UIView {
    _ = _anchorHeight(constant, relation: relation, priority: priority)
    return self
  }
  
  @discardableResult
  func anchorEqualWidth(_ width: NSLayoutDimension, relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> UIView {
    translatesAutoresizingMaskIntoConstraints = false
    
    let anchor = widthAnchor.constraint(equalTo: width, multiplier: 1.0)
    anchor.priority = priority
    anchor.isActive = true
    return self
  }
  
  @discardableResult
  func anchorEqualHeight(_ height: NSLayoutDimension, priority: UILayoutPriority = .required, multiplier: CGFloat = 1) -> UIView {
    translatesAutoresizingMaskIntoConstraints = false
    
    let anchor = heightAnchor.constraint(equalTo: height, multiplier: multiplier)
    anchor.priority = priority
    anchor.isActive = true
    return self
  }
}
