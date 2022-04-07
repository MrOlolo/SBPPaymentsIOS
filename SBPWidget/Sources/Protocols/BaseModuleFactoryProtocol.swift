//
//  File.swift
//  SBPWidget
//
//  Created by Mykola Hordynchuk on 6/9/19.
//  Copyright © 2019 Mykola Hordynchuk. All rights reserved.
//

import Foundation

protocol BaseModuleFactoryProtocol {
  associatedtype ModuleInput
  static func create() -> (input: ModuleInput, viewable: ModuleViewable, router: BaseRouterProtocol)
}
