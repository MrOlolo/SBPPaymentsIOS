//
//  SBPWidgetBankViewItem.swift
//  SBPWidget
//
//  Created by Mykola Hordynchuk on 05.12.2020.
//  Copyright © 2020 Mykola Hordynchuk. All rights reserved.
//

import Foundation

struct SBPWidgetBankViewItem {
  var title: String
  var logoURL: URL?
  
  init(with item: SBPBank) {
    self.title = item.bankName
    self.logoURL = URL(string: item.logoURL)
  }
}
