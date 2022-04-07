//
//  BaseInteractiveView.swift
//  SBPWidget
//
//  Created by Mykola Hordynchuk on 6/9/19.
//  Copyright © 2019 Mykola Hordynchuk. All rights reserved.
//

import UIKit

extension UIView {
  func removeAllConstraints() {
    guard !(self is UINavigationBar) else { return }
    removeConstraints(self.constraints)
    if self.subviews.count > 0 {
      for view in self.subviews {
        view.removeAllConstraints()
      }
    }
  }
}

class BaseInteractiveView: UIView {
  @objc func injected() {
    subviews.forEach { subview in
      subview.removeFromSuperview()
    }
    
    addViews()
    anchorViews()
    configureViews()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addViews()
    anchorViews()
    configureViews()
  }
  
  @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
    fatalError("required init not implemented")
  }
  
  //to override
  func addViews() {}
  func anchorViews() {}
  func configureViews() {}
}
