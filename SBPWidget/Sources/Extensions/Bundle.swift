//
//  Bundle.swift
//  SBPWidget
//
//  Created by m on 22.03.2021.
//

import Foundation

extension Bundle {
  static let sbpBundle: Bundle = {
    Bundle(for: SBPWidgetModule.self)
  }()
}
