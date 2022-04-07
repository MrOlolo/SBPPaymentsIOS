//
//  String+Localized.swift
//  NewPay
//
//  Created by Mykola Hordynchuk on 6/9/19.
//  Copyright © 2019 Mykola Hordynchuk. All rights reserved.
//

import Foundation

extension String {
  private var defaultTranslation: String {
    let localizableFolderType = "lproj"
    
    if let path = Bundle.main.path(forResource: "Base", ofType: localizableFolderType), let bundle = Bundle(path: path) {
      return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
    } else {
      return self
    }
  }
  
  func localized(language: String = "Base") -> String {
    let localizableFolderType = "lproj"
    
    if let path = Bundle.sbpBundle.path(forResource: language, ofType: localizableFolderType), let bundle = Bundle(path: path) {
      
      let value = NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
      if value == self {
        return defaultTranslation
      } else {
        return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
      }
      
    } else {
      return defaultTranslation
    }
  }
}
