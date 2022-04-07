//
//  CloseRoute.swift
//  SBPWidget
//
//  Created by Nikolay Hordynchuk on 8/16/19.
//  Copyright © 2019 Mykola Hordynchuk. All rights reserved.
//

import Foundation

protocol CloseRoute {
  func toClose()
  func toClose(_ completion: VoidClosure?)
}

extension CloseRoute where Self: BaseRouterProtocol {
  func toClose() {
    close(completion: nil)
  }
  
  func toClose(_ completion: VoidClosure?) {
    close(completion: completion)
  }
}

