//
//  UIView+ReturnAnchors.swift
//  SBPWidget
//
//  Created by Mykola Hordynchuk on 6/9/19.
//  Copyright © 2019 Mykola Hordynchuk. All rights reserved.
//

import UIKit

extension UIView {
  func _anchorTop(_ top: NSLayoutYAxisAnchor, _ constant: CGFloat, relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
    translatesAutoresizingMaskIntoConstraints = false
    
    var anchor: NSLayoutConstraint
    switch relation {
    case .greaterThanOrEqual:
      anchor = topAnchor.constraint(greaterThanOrEqualTo: top, constant: constant)
    case .lessThanOrEqual:
      anchor = topAnchor.constraint(lessThanOrEqualTo: top, constant: constant)
    default:
      anchor = topAnchor.constraint(equalTo: top, constant: constant)
    }
    
    anchor.priority = priority
    anchor.isActive = true
    return anchor
  }
  
  func _anchorBottom(_ bottom: NSLayoutYAxisAnchor, _ constant: CGFloat, relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
    translatesAutoresizingMaskIntoConstraints = false
    
    var anchor: NSLayoutConstraint
    switch relation {
    case .greaterThanOrEqual:
      anchor = bottomAnchor.constraint(greaterThanOrEqualTo: bottom, constant: -constant)
    case .lessThanOrEqual:
      anchor = bottomAnchor.constraint(lessThanOrEqualTo: bottom, constant: -constant)
    default:
      anchor = bottomAnchor.constraint(equalTo: bottom, constant: -constant)
    }
    
    anchor.priority = priority
    anchor.isActive = true
    return anchor
  }
  
  func _anchorLeft(_ left: NSLayoutXAxisAnchor, _ constant: CGFloat, relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
    translatesAutoresizingMaskIntoConstraints = false
    
    var anchor: NSLayoutConstraint
    switch relation {
    case .greaterThanOrEqual:
      anchor = leftAnchor.constraint(greaterThanOrEqualTo: left, constant: constant)
    case .lessThanOrEqual:
      anchor = leftAnchor.constraint(lessThanOrEqualTo: left, constant: constant)
    default:
      anchor = leftAnchor.constraint(equalTo: left, constant: constant)
    }
    
    anchor.priority = priority
    anchor.isActive = true
    return anchor
  }
  
  func _anchorRight(_ right: NSLayoutXAxisAnchor, _ constant: CGFloat, relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
    translatesAutoresizingMaskIntoConstraints = false
    
    var anchor: NSLayoutConstraint
    switch relation {
    case .greaterThanOrEqual:
      anchor = rightAnchor.constraint(greaterThanOrEqualTo: right, constant: -constant)
    case .lessThanOrEqual:
      anchor = rightAnchor.constraint(lessThanOrEqualTo: right, constant: -constant)
    default:
      anchor = rightAnchor.constraint(equalTo: right, constant: -constant)
    }
    
    anchor.priority = priority
    anchor.isActive = true
    return anchor
  }
  
  func _anchorWidth(_ constant: CGFloat, relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
    translatesAutoresizingMaskIntoConstraints = false
    
    var anchor: NSLayoutConstraint
    switch relation {
    case .greaterThanOrEqual:
      anchor = widthAnchor.constraint(greaterThanOrEqualToConstant: constant)
    case .lessThanOrEqual:
      anchor = widthAnchor.constraint(lessThanOrEqualToConstant: constant)
    default:
      anchor = widthAnchor.constraint(equalToConstant: constant)
    }
    
    anchor.priority = priority
    anchor.isActive = true
    return anchor
  }
  
  func _anchorHeight(_ constant: CGFloat, relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
    translatesAutoresizingMaskIntoConstraints = false
    
    var anchor: NSLayoutConstraint
    switch relation {
    case .greaterThanOrEqual:
      anchor = heightAnchor.constraint(greaterThanOrEqualToConstant: constant)
    case .lessThanOrEqual:
      anchor = heightAnchor.constraint(lessThanOrEqualToConstant: constant)
    default:
      anchor = heightAnchor.constraint(equalToConstant: constant)
    }
    
    anchor.priority = priority
    anchor.isActive = true
    return anchor
  }
  
  func _anchorCenterY(_ centerYAnchor: NSLayoutYAxisAnchor, _ constant: CGFloat, relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
    translatesAutoresizingMaskIntoConstraints = false
    
    var anchor: NSLayoutConstraint
    switch relation {
    case .greaterThanOrEqual:
      anchor = self.centerYAnchor.constraint(greaterThanOrEqualTo: centerYAnchor, constant: constant)
    case .lessThanOrEqual:
      anchor = self.centerYAnchor.constraint(lessThanOrEqualTo: centerYAnchor, constant: constant)
    default:
      anchor = self.centerYAnchor.constraint(equalTo: centerYAnchor, constant: constant)
    }
    
    anchor.priority = priority
    anchor.isActive = true
    return anchor
  }
}
