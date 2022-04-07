
//
//  BaseTableViewCell.swift
//  SBPWidget
//
//  Created by Mykola Hordynchuk on 6/9/19.
//  Copyright © 2019 Mykola Hordynchuk. All rights reserved.
//

import UIKit

class BaseTableViewCell<View: UIView>: UITableViewCell {
  var mainView: View
 
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    self.mainView = View()
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubview(mainView)
    mainView.fillSuperview()
    selectionStyle = .none
    backgroundColor = .clear
  }
 
  @available (*, unavailable) required init?(coder aDecoder: NSCoder) {
    fatalError("required init not implemented")
  }
}
